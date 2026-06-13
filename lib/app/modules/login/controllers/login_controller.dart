import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/widgets/common_loader.dart';
import '../../../../core/utils/common_toast.dart';
import '../../../data/services/auth/auth_service.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final mobileNumberController = TextEditingController().obs;

  final AuthService _authService = AuthService.create();

  RxBool isLoading = false.obs;

  RxBool isDisable = false.obs;


  Future<void> sendOtp() async {

    try {

      isLoading.value = true;

      Loading().onLoading();

      final response = await _authService.sendOtp({
        "mobile": mobileNumberController.value.text,
      });

      if (response.isSuccessful) {

        AppToast.show(
          message: "${response.body!['message']}",
          type: AppToastType.success,
        );

        Get.toNamed(
            Routes.OTP_VERIFY,
            arguments: {
              "mobile":mobileNumberController.value.text
            }
        );


        print(response.body);

      } else {

        AppToast.show(
          message: response.error.toString(),
          type: AppToastType.error,
        );

      }

    } catch (e) {

      AppToast.show(
        message: e.toString(),
        type: AppToastType.error,
      );

    } finally {

      isLoading.value = false;

      Loading().onDone();

    }
  }

}
