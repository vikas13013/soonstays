import 'package:get/get.dart';

import '../controllers/my_trip_details_controller.dart';

class MyTripDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTripDetailsController>(
      () => MyTripDetailsController(),
    );
  }
}
