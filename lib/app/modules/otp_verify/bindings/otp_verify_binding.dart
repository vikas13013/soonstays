import 'package:chopper/chopper.dart' hide Get;
import 'package:get/get.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/services/auth/auth_service.dart';
import '../controllers/otp_verify_controller.dart';

class OtpVerifyBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<OtpVerifyController>(
          () => OtpVerifyController(),
    );

  }
}
