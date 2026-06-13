import 'package:get/get.dart';

import '../../../data/model/bookings/bookings_model.dart';

class MyTripDetailsController extends GetxController {
  //TODO: Implement MyTripDetailsController

  @override
  void onInit() {
    super.onInit();

    BookingData.value = Get.arguments;

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  final BookingData = BookingList().obs;

}
