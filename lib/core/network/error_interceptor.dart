import 'dart:convert';
import 'dart:io';

import 'package:chopper/chopper.dart' hide Get;
import 'package:get/get.dart' hide Response;

import '../../app/data/api_client/api_client.dart';
import '../../app/data/services/auth/auth_service.dart';
import '../../app/routes/app_pages.dart';
import '../get_storage/session_manager.dart';
import '../utils/common_toast.dart';

class ErrorInterceptor implements Interceptor {
  static bool _isRefreshing = false;
  static bool _isShowingInternetToast = false;

  @override
  Future<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain,
      ) async {
    try {
      final Response<BodyType> response =
      await chain.proceed(chain.request);

      /// ==========================
      /// 401 Unauthorized
      /// ==========================
      if (response.statusCode == 401) {
        if (_isRefreshing) {
          return response;
        }

        _isRefreshing = true;

        final bool refreshSuccess =
        await _refreshAccessToken();

        _isRefreshing = false;

        if (refreshSuccess) {
          final newToken =
              SessionManager.instance.accessToken;

          final newRequest = applyHeader(
            chain.request,
            'Authorization',
            'Bearer $newToken',
          );

          return await chain.proceed(newRequest);
        }

        await SessionManager.instance.logout();

        Get.offAllNamed(Routes.HOME);

        AppToast.show(
          message: "Session expired. Please login again.",
          type: AppToastType.error,
        );

        return response;
      }

      /// ==========================
      /// API Errors
      /// ==========================
      if (!response.isSuccessful) {
        try {
          String message = "Something went wrong";

          if (response.error != null) {
            final decoded = jsonDecode(
              response.error.toString(),
            );

            message =
                decoded['message']?.toString() ??
                    message;
          }

          AppToast.show(
            message: message,
            type: AppToastType.error,
          );
        } catch (_) {
          AppToast.show(
            message: "Something went wrong",
            type: AppToastType.error,
          );
        }
      }

      return response;
    }

    /// ==========================
    /// No Internet
    /// ==========================
    on SocketException {
      _showInternetToast();
      rethrow;
    }

    /// ==========================
    /// Any Other Error
    /// ==========================
    catch (e) {
      print("Interceptor Error => $e");
      rethrow;
    }
  }

  static void _showInternetToast() {
    if (_isShowingInternetToast) return;

    _isShowingInternetToast = true;

    AppToast.show(
      message: "No internet connection",
      type: AppToastType.error,
    );

    Future.delayed(
      const Duration(seconds: 2),
          () {
        _isShowingInternetToast = false;
      },
    );
  }

  Future<bool> _refreshAccessToken() async {
    try {
      final authService =
      chopperClient.getService<AuthService>();

      final response = await authService.refreshToken({
        "refresh_token":
        SessionManager.instance.refreshToken,
      });

      if (response.isSuccessful) {
        final data = response.body;

        await SessionManager.instance.saveTokens(
          accessToken: data['access_token'],
          refreshToken: data['refresh_token'],
        );

        return true;
      }

      return false;
    } catch (e) {
      print("Refresh Token Error => $e");
      return false;
    }
  }
}