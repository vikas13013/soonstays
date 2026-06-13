import 'package:chopper/chopper.dart' hide Get;
import 'package:get/get.dart';

import '../api_client/api_client.dart' hide Get;
import '../services/profile/profile_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<ChopperClient>(chopperClient);

    Get.put<ProfileService>(
      chopperClient.getService<ProfileService>(),
    );
  }
}