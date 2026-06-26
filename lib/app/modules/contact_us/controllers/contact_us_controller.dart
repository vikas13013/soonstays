import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonstays/app/data/services/contact_us/contact_us_service.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/common_toast.dart';
import '../../../../core/widgets/common_captcha.dart';
import '../../../../core/widgets/common_dialog.dart';
import '../../../../core/widgets/common_loader.dart';
import '../../../data/api_client/api_client.dart';

class ContactUsController extends GetxController {
  //TODO: Implement ContactUsController

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

  final fullNameController = TextEditingController().obs;

  final mobileController = TextEditingController().obs;

  final emailController = TextEditingController().obs;

  final descriptionController = TextEditingController().obs;

  final captchaController = TextEditingController().obs;

  final captchaValue = "".obs;


  final ContactUsService contactUsService = chopperClient.getService<ContactUsService>();

  Future<void> submitContactUs() async {

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
          "name":fullNameController.value.text,
          "mobile":mobileController.value.text,
          "email":emailController.value.text,
          "message":descriptionController.value.text
        };


        final response = await contactUsService.submitContact(request);

        if (response.isSuccessful) {

          clearData();

          CommonDialogs.CommonStatusDialog(
            icon: Icons.verified_rounded,
            iconColor: AppColors.green,
            title: AppStrings.messageSent,
            message: AppStrings.ourSupportExecutivesHaveReceivedYourQuery,
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

    fullNameController.value.clear();

    mobileController.value.clear();

    emailController.value.clear();

    descriptionController.value.clear();

    captchaController.value.clear();

    captchaKey.value.currentState?.generateCaptcha();

  }


}
