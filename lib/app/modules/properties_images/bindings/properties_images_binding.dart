import 'package:get/get.dart';

import '../controllers/properties_images_controller.dart';

class PropertiesImagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertiesImagesController>(
      () => PropertiesImagesController(),
    );
  }
}
