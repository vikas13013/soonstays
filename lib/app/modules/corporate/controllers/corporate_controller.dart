import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/app/data/services/corporate/corporate_service.dart';
import 'package:soonstays/core/constants/app_colors.dart';
import 'package:soonstays/core/constants/app_strings.dart';
import 'package:soonstays/core/widgets/common_dialog.dart';
import 'package:soonstays/core/widgets/common_loader.dart';

import '../../../../core/utils/common_toast.dart';
import '../../../../core/widgets/common_captcha.dart';
import '../../../data/api_client/api_client.dart';

class CorporateController extends GetxController {
  //TODO: Implement CorporateController

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


  final captchaKey = GlobalKey<CommonCaptchaState>().obs;

  final globalKey = GlobalKey<FormState>().obs;

  final nameController = TextEditingController().obs;

  final mobileController = TextEditingController().obs;

  final emailController = TextEditingController().obs;

  final companyNameController = TextEditingController().obs;

  final captchaController = TextEditingController().obs;

  final captchaValue = "".obs;


  final CorporateService profileService = chopperClient.getService<CorporateService>();

  Future<void> submitCorporate() async {

    try {

      if(globalKey.value.currentState!.validate()){

        if (captchaController.value.text.toString().trim() != captchaValue.value.toString().trim()) {

          AppToast.show(
            message: "${AppStrings.invalidCaptcha}",
            type: AppToastType.error,
          );

          captchaKey.value.currentState?.generateCaptcha();

          return;
        }

        Loading().onLoading();

        final request = {
          "captcha":captchaController.value.text,
          "name":nameController.value.text,
          "mobile":mobileController.value.text,
          "email":emailController.value.text,
          "company_name":companyNameController.value.text
        };

        final response = await profileService.submitCorporate(request);

        if (response.isSuccessful) {

          clearData();

          CommonDialogs.CommonStatusDialog(
            icon: Icons.verified_rounded,
            iconColor: AppColors.green,
            title: AppStrings.requestReceived,
            message: AppStrings.thankYouForReachingOut,
            buttonText: AppStrings.done,
            onTap: () {
              Get.back();
            },
          );


        }

      }


    } catch (e) {

      print(e);

    }finally{

      Loading().onDone();

    }
  }


  clearData(){

    nameController.value.clear();

    mobileController.value.clear();

    emailController.value.clear();

    companyNameController.value.clear();

    captchaController.value.clear();

    captchaKey.value.currentState?.generateCaptcha();

  }


}
