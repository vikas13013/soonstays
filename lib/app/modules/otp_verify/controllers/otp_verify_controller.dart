import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:soonstays/app/routes/app_pages.dart';

import '../../../../core/get_storage/session_manager.dart';
import '../../../../core/utils/common_toast.dart';
import '../../../../core/widgets/common_loader.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/services/auth/auth_service.dart';

class OtpVerifyController extends GetxController {
  //TODO: Implement OtpVerifyController

  @override
  void onInit() {
    super.onInit();

    mobileNumber.value = Get.arguments['mobile'];

    startTimer();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }


  final mobileNumber = "".obs;

  final pinInputController = TextEditingController().obs;

  final isDisable = false.obs;

  RxInt secondsRemaining = 30.obs;
  RxBool canResendOtp = false.obs;

  Timer? _timer;


  void startTimer() {

    canResendOtp.value = false;

    secondsRemaining.value = 30;

    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (secondsRemaining.value > 0) {
          secondsRemaining.value--;
        } else {
          canResendOtp.value = true;
          timer.cancel();
        }
      },
    );
  }

  String get formattedTime {

    final minutes = (secondsRemaining.value ~/ 60).toString().padLeft(2, '0');

    final seconds = (secondsRemaining.value % 60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }

  final repository = AuthRepository();

  Future<void> sendOtp() async {

    try {

      Loading().onLoading();

      final response = await repository.sendOtp(mobileNumber.value);

      if (response.isSuccessful) {

        AppToast.show(
          message: "OTP resent to +91 ${mobileNumber.value}",
          type: AppToastType.success,
        );

        startTimer();

        print(response.body);

      } else {

        AppToast.show(
          message: response.error.toString(),
          type: AppToastType.success,
        );

      }

    } catch (e) {

      AppToast.show(
        message: e.toString(),
        type: AppToastType.error,
      );

    } finally {

      Loading().onDone();

    }
  }

  Future<void> verifyOtp({
    required String mobile,
    required String otp,
  }) async {

    try {

      Loading().onLoading();

      final response = await repository.verifyOtp(
        mobile: mobile,
        otp: otp,
      );


      if (response.isSuccessful) {

        final data = response.body;

        await SessionManager.instance.saveSession(

          accessToken: data['access_token'] ?? "",

          refreshToken: data['refresh_token'] ?? "",

          tempId: data['temp_id'] ?? "",

          user: data['user'] ?? {},
        );

        Get.offAllNamed(Routes.DASHBOARD);

      }

    }finally {

      Loading().onDone();

    }
  }


}
