import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_assets.dart';
import '../../../../core/get_storage/session_manager.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  @override
  void onInit() {
    super.onInit();

    _init();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final logo = AppAssets.logo;

  void _init() async {

    await Future.delayed(const Duration(seconds: 4)); // Splash delay

    if (SessionManager.instance.isLoggedIn) {

      Get.offAllNamed(
        Routes.HOME,
      );

    } else {

      Get.offAllNamed(
          Routes.HOME
      );

    }
  }

}
