import 'package:get/get.dart';
import 'package:soonstays/app/modules/my_trips/controllers/my_trips_controller.dart';
import 'package:soonstays/app/modules/user_profile/controllers/user_profile_controller.dart';

import '../../corporate/controllers/corporate_controller.dart';
import '../../franchise/controllers/franchise_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../login/controllers/login_controller.dart';
import '../../travel_agent/controllers/travel_agent_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => DashboardController());

    /// TAB CONTROLLERS
    Get.lazyPut(() => HomeController());

    Get.lazyPut(() => MyTripsController());

    Get.lazyPut(() => UserProfileController());

  }
}
