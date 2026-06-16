import 'package:get/get.dart';

import '../modules/about_us/bindings/about_us_binding.dart';
import '../modules/about_us/views/about_us_view.dart';
import '../modules/booking_screen/bindings/booking_screen_binding.dart';
import '../modules/booking_screen/views/booking_screen_view.dart';
import '../modules/cancellation_policy/bindings/cancellation_policy_binding.dart';
import '../modules/cancellation_policy/views/cancellation_policy_view.dart';
import '../modules/contact_us/bindings/contact_us_binding.dart';
import '../modules/contact_us/views/contact_us_view.dart';
import '../modules/corporate/bindings/corporate_binding.dart';
import '../modules/corporate/views/corporate_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/faq/bindings/faq_binding.dart';
import '../modules/faq/views/faq_view.dart';
import '../modules/franchise/bindings/franchise_binding.dart';
import '../modules/franchise/views/franchise_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/investor/bindings/investor_binding.dart';
import '../modules/investor/views/investor_view.dart';
import '../modules/legal_policy/bindings/legal_policy_binding.dart';
import '../modules/legal_policy/views/legal_policy_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/menu/bindings/menu_binding.dart';
import '../modules/menu/views/menu_view.dart';
import '../modules/my_trip_details/bindings/my_trip_details_binding.dart';
import '../modules/my_trip_details/views/my_trip_details_view.dart';
import '../modules/my_trips/bindings/my_trips_binding.dart';
import '../modules/my_trips/views/my_trips_view.dart';
import '../modules/otp_verify/bindings/otp_verify_binding.dart';
import '../modules/otp_verify/views/otp_verify_view.dart';
import '../modules/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/privacy_policy/views/privacy_policy_view.dart';
import '../modules/property_details/bindings/property_details_binding.dart';
import '../modules/property_details/views/property_details_view.dart';
import '../modules/property_list/bindings/property_list_binding.dart';
import '../modules/property_list/views/property_list_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/terms_conditions/bindings/terms_conditions_binding.dart';
import '../modules/terms_conditions/views/terms_conditions_view.dart';
import '../modules/travel_agent/bindings/travel_agent_binding.dart';
import '../modules/travel_agent/views/travel_agent_view.dart';
import '../modules/user_profile/bindings/user_profile_binding.dart';
import '../modules/user_profile/views/user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CORPORATE,
      page: () => const CorporateView(),
      binding: CorporateBinding(),
    ),
    GetPage(
      name: _Paths.FRANCHISE,
      page: () => const FranchiseView(),
      binding: FranchiseBinding(),
    ),
    GetPage(
      name: _Paths.TRAVEL_AGENT,
      page: () => const TravelAgentView(),
      binding: TravelAgentBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => const AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: _Paths.INVESTOR,
      page: () => const InvestorView(),
      binding: InvestorBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: _Paths.FAQ,
      page: () => const FaqView(),
      binding: FaqBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_CONDITIONS,
      page: () => const TermsConditionsView(),
      binding: TermsConditionsBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.CANCELLATION_POLICY,
      page: () => const CancellationPolicyView(),
      binding: CancellationPolicyBinding(),
    ),
    GetPage(
      name: _Paths.LEGAL_POLICY,
      page: () => const LegalPolicyView(),
      binding: LegalPolicyBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_DETAILS,
      page: () => const PropertyDetailsView(),
      binding: PropertyDetailsBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_SCREEN,
      page: () => BookingScreenView(),
      binding: BookingScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_LIST,
      page: () => const PropertyListView(),
      binding: PropertyListBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFY,
      page: () => OtpVerifyView(),
      binding: OtpVerifyBinding(),
    ),
    GetPage(
      name: _Paths.MY_TRIPS,
      page: () => MyTripsView(),
      binding: MyTripsBinding(),
    ),
    GetPage(
      name: _Paths.MY_TRIP_DETAILS,
      page: () => const MyTripDetailsView(),
      binding: MyTripDetailsBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => MenuView(),
      binding: MenuBinding(),
    ),
  ];
}
