import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soonstays/core/get_storage/session_manager.dart';
import 'package:soonstays/core/widgets/common_loader.dart';

import '../../../../core/utils/common_toast.dart';
import '../../../data/api_client/api_client.dart';
import '../../../data/model/profile/profile_data_modal.dart';
import '../../../data/services/profile/profile_service.dart';

class UserProfileController extends GetxController {
  //TODO: Implement UserProfileController

  @override
  void onInit() {
    super.onInit();

    getProfile();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  final userData = UserProfileModel().obs;

  RxString selectedGender = "Male".obs;

  final nameController = TextEditingController().obs;

  final nameValue = "".obs;

  final emailController = TextEditingController().obs;

  final emailValue = "".obs;

  final mobileController = TextEditingController().obs;

  final mobileValue = "".obs;

  void changeGender(String gender) {
    selectedGender.value = gender;
  }

  final ProfileService profileService = chopperClient.getService<ProfileService>();

  final isLoading = true.obs;

  Future<void> getProfile() async {
    try {

      final response = await profileService.getProfile();

      if (response.isSuccessful) {

        userData.value = UserProfileModel.fromJson(response.body);

        SessionManager.instance.updateUser(response.body);

        fillUserData();

        print(userData.value.fullName);

      }


    } catch (e) {
      print(e);
    } finally {

      isLoading.value = false;

      Loading().onDone();

    }
  }

  Future<void> updateProfile() async {

    try {

      Loading().onLoading();

      final response = await profileService.updateProfile(

        userData.value.id!,

        {
          "full_name": nameController.value.text.toString().trim(),
          "email": emailController.value.text.toString().trim(),
          "gender": selectedGender.value,
          "city": "",
          "dob": "",
        },
      );

      if (response.isSuccessful) {

        AppToast.show(
          message:
          "Profile updated successfully",
          type: AppToastType.success,
        );

        getProfile();

      }

    } catch (e) {

      print(e);

    }finally{

      Loading().onDone();

    }


  }

  fillUserData(){

    nameValue.value = "${userData.value.fullName??""}";
    nameController.value.text = "${userData.value.fullName??""}";

    emailValue.value = "${userData.value.email??""}";
    emailController.value.text = "${userData.value.email??""}";

    mobileValue.value = "${userData.value.mobileNo??""}";
    mobileController.value.text = "${userData.value.mobileNo??""}";

    changeGender("${userData.value.gender}");

    update();

  }

}
