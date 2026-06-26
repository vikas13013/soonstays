import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/app/data/services/investor/investor_service.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/common_toast.dart';
import '../../../../core/widgets/common_captcha.dart';
import '../../../../core/widgets/common_dialog.dart';
import '../../../../core/widgets/common_loader.dart';
import '../../../data/api_client/api_client.dart';

class InvestorController extends GetxController {
  //TODO: Implement InvestorController

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

  final captchaController = TextEditingController().obs;

  final captchaValue = "".obs;

  final InvestorService investorService = chopperClient.getService<InvestorService>();

  Future<void> submitInvestor() async {

    try {

      if(globalKey.value.currentState!.validate()){

        if (captchaController.value.text.toString().trim() != captchaValue.value.toString().trim()) {

          AppToast.show(
            message: AppStrings.invalidCaptcha,
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
          "email":emailController.value.text
        };


        final response = await investorService.submitInvestor(request);

        if (response.isSuccessful) {

          clearData();

          CommonDialogs.CommonStatusDialog(
            icon: Icons.verified_rounded,
            iconColor: AppColors.green,
            title: AppStrings.enquiryReceived,
            message: AppStrings.thankYouForYourInterestOurStrategic,
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

    captchaController.value.clear();

    captchaKey.value.currentState?.generateCaptcha();

  }



}
