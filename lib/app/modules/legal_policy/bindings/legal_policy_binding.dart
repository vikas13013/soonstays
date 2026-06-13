import 'package:get/get.dart';

import '../controllers/legal_policy_controller.dart';

class LegalPolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LegalPolicyController>(
      () => LegalPolicyController(),
    );
  }
}
