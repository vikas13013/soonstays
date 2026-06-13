import 'dart:async';
import 'package:get/get.dart' hide Response;
import 'package:chopper/chopper.dart' hide Get;
import 'package:get_storage/get_storage.dart';
import 'package:soonstays/core/get_storage/session_manager.dart';

class AuthInterceptor implements Interceptor {

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {

    final token = SessionManager.instance.accessToken;

    final request = applyHeader(
      chain.request,
      'Authorization',
      'Bearer $token',
    );

    return chain.proceed(request);
  }
}