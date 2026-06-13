import 'package:get/get.dart';

import '../controllers/cancellation_policy_controller.dart';

class CancellationPolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CancellationPolicyController>(
      () => CancellationPolicyController(),
    );
  }
}
