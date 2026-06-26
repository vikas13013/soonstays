import 'package:chopper/chopper.dart';
import 'package:soonstays/app/data/services/auth/auth_service.dart';
import 'package:soonstays/app/data/services/contact_us/contact_us_service.dart';
import 'package:soonstays/app/data/services/investor/investor_service.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/network/auth_interceptor.dart';
import '../../../core/network/error_interceptor.dart';
import '../services/booking/booking_service.dart';
import '../services/checkout/checkout_service.dart';
import '../services/corporate/corporate_service.dart';
import '../services/coupon/offer_service.dart';
import '../services/franchise/franchise_service.dart';
import '../services/profile/profile_service.dart';
import '../services/travel_agent/travel_agent_service.dart';

final chopperClient = ChopperClient(

  baseUrl: Uri.parse(ApiConstants.baseUrl),

  services: [

    ///Auth Services Create
    AuthService.create(),

    ///Profile Service Create
    ProfileService.create(),

    ///Corporate Service Create
    CorporateService.create(),

    ///Franchise Service Create
    FranchiseService.create(),

    ///Travel Agent Service Create
    TravelAgentService.create(),

    ///Checkout Service Create
    CheckoutService.create(),

    ///Offer Service Create
    OfferService.create(),

    ///Booking Service Create
    BookingService.create(),

    ///Investor Service Create
    InvestorService.create(),

    ///ContactUs Service Create
    ContactUsService.create(),

  ],

  converter: const JsonConverter(),

  interceptors: [

    AuthInterceptor(),

    ErrorInterceptor(),

    HttpLoggingInterceptor(),

  ],

);
