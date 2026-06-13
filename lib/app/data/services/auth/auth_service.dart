import 'package:chopper/chopper.dart';
import 'package:soonstays/core/constants/api_constants.dart';

import '../../../../core/network/error_interceptor.dart';

part 'auth_service.chopper.dart';

@ChopperApi()
abstract class AuthService extends ChopperService {

  /// Send OTP Login

  @Post(path: ApiConstants.sendOtp)
  Future<Response<Map<String, dynamic>>> sendOtp(
      @Body() Map<String, dynamic> body,
      );

  /// Verify OTP Login
  @Post(path: ApiConstants.loginOtp)
  Future<Response<Map<String, dynamic>>> verifyOtp(
      @Body() Map<String, dynamic> body,
      );

  @POST(path: ApiConstants.refreshToken)
  Future<Response> refreshToken(
      @Body() Map<String, dynamic> body,
      );

  static AuthService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(ApiConstants.baseUrl),
      services: [
        _$AuthService(),
      ],
      converter: const JsonConverter(),
      interceptors: [
        ErrorInterceptor(),
      ]
    );

    return _$AuthService(client);
  }

}