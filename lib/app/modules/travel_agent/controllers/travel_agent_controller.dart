import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/common_toast.dart';
import '../../../../core/widgets/common_captcha.dart';
import '../../../../core/widgets/common_dialog.dart';
import '../../../../core/widgets/common_loader.dart';
import '../../../data/api_client/api_client.dart';
import '../../../data/services/travel_agent/travel_agent_service.dart';

class TravelAgentController extends GetxController {
  //TODO: Implement TravelAgentController

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

  final travelAgentNameController = TextEditingController().obs;

  final travelAgentCityController = TextEditingController().obs;

  final captchaController = TextEditingController().obs;

  final captchaValue = "".obs;


  final TravelAgentService travelAgentService = chopperClient.getService<TravelAgentService>();

  Future<void> submitTravelAgent() async {

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
          "email":emailController.value.text,
          "property_name":travelAgentNameController.value.text,
          "property_city":travelAgentCityController.value.text
        };


        final response = await travelAgentService.submitTravelAgent(request);

        if (response.isSuccessful) {

          clearData();

          CommonDialogs.CommonStatusDialog(
            icon: Icons.verified_rounded,
            iconColor: AppColors.green,
            title: AppStrings.registrationReceived,
            message: AppStrings.thankYouForChoosingSoonstaysAsYourTravelPartner,
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

    travelAgentNameController.value.clear();

    travelAgentCityController.value.clear();

    captchaController.value.clear();

    captchaKey.value.currentState?.generateCaptcha();

  }

}
