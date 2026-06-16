import 'package:get/get.dart';
import 'package:soonstays/core/get_storage/session_manager.dart';

class MenuViewController extends GetxController {
  //TODO: Implement MenuController

  @override
  void onInit() {
    super.onInit();

    fillData();

  }

  @override
  void onReady() {
    super.onReady();

    print("Hello Check");

  }

  @override
  void onClose() {
    super.onClose();
  }

  fillData() {

    nameValue.value = SessionManager.instance.user["full_name"];

    mobileValue.value = SessionManager.instance.user["mobile_no"];

    emailValue.value = SessionManager.instance.user["email"];

  }

  final nameValue = "".obs;

  final emailValue = "".obs;

  final mobileValue = "".obs;

  String getInitials(String name) {
    return name
        .trim()
        .split(' ')
        .where((e) => e.isNotEmpty)
        .map((e) => e[0])
        .join()
        .toUpperCase();
  }

}
