import 'package:chopper/chopper.dart';

import '../services/auth/auth_service.dart';

class AuthRepository {

  final AuthService service = AuthService.create();

  AuthRepository();

  Future<Response<dynamic>> sendOtp(
      String mobile) {

    return service.sendOtp({
      "mobile": mobile,
    });
  }

  Future<Response<dynamic>> verifyOtp({
    required String mobile,
    required String otp,
  }) {

    return service.verifyOtp({
      "mobile": mobile,
      "otp": otp,
    });
  }
}