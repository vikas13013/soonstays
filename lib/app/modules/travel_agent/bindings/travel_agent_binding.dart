import 'package:get/get.dart';

import '../controllers/travel_agent_controller.dart';

class TravelAgentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelAgentController>(
      () => TravelAgentController(),
    );
  }
}
