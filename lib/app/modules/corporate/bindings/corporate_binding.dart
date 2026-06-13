import 'package:get/get.dart';

import '../controllers/corporate_controller.dart';

class CorporateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CorporateController>(
      () => CorporateController(),
    );
  }
}
