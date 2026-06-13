import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soonstays/app/data/services/booking/booking_service.dart';
import 'package:soonstays/app/data/services/coupon/offer_service.dart';
import 'package:soonstays/app/routes/app_pages.dart';
import 'package:soonstays/core/widgets/common_dialog.dart';
import '../../../../core/get_storage/session_manager.dart';
import '../../../../core/utils/common_toast.dart';
import '../../../../core/widgets/common_loader.dart';
import '../../../data/api_client/api_client.dart';
import '../../../data/model/offers/validate_coupon_request.dart';
import '../../../data/model/property_details/available_rooms_model.dart';
import '../../../data/model/property_details/property_details_model.dart';
import '../../../data/model/search_criteria_model.dart';
import '../../../data/services/checkout/checkout_service.dart';

class BookingScreenController extends GetxController {
  //TODO: Implement BookingScreenController

  @override
  void onInit() {
    super.onInit();

    final data = Get.arguments;

    CheckoutDataGet(data: data);

    getCoupons();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

    _timer?.cancel();

    super.onClose();
  }

  RxInt currentStep = 0.obs;

  RxInt selectedPayment = 0.obs;

  final List<String> stepList = [
    "Review",
    "Payment",
    "Confirmed"
  ];

  void nextStep() {
    if (currentStep.value < stepList.length - 1) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  void changeStep(int index) {
    currentStep.value = index;
  }

  final allCheckoutData = {}.obs;

  final propertyData = PropertyDetailsModel().obs;

  final availableRoomsData = AvailableRoomsList().obs;

  final ratePlansData = RatePlans().obs;

  final availableRoomsList = <AvailableRoomsList>[].obs;

  final searchCriteria = {}.obs;

  final isLoading = true.obs;

  ///Checkout

  final CheckoutService checkoutService = chopperClient.getService<CheckoutService>();

  Future CheckoutDataGet({
     data
   }) async{

    allCheckoutData.value = data;

    propertyData.value = PropertyDetailsModel.fromJson(data['property']);

    availableRoomsList.value = (data['available_rooms'] as List).map((e) => AvailableRoomsList.fromJson(e)).toList().obs;

    searchCriteria.value = data['searchCriteria'];

    ///To Get data to room Id
    final roomId = allCheckoutData.value['roomId']?.toString();

    final selectedRoom = availableRoomsList.firstWhereOrNull(
          (room) => room.id.toString() == roomId,
    );

    if (selectedRoom != null) {
      availableRoomsData.value = selectedRoom;
    }


    ///To Get data to room plan Id
    final roomPlanId = allCheckoutData.value['ratePlanId']?.toString();

    final ratePlanList = availableRoomsData.value.ratePlans??[];

    final selectedPlan = ratePlanList.firstWhereOrNull(
          (room) => room.id.toString() == roomPlanId,
    );

    if (selectedPlan != null) {
      ratePlansData.value = selectedPlan;
    }

    await checkout();

  }

  final checkOutResponse = {}.obs;

  Future<void> checkout() async {

    try {

      final response = await checkoutService.checkout(allCheckoutData.toJson());

      if (response.isSuccessful) {

        final body = response.body;

        startSession(
          body['ttlSeconds'] ?? 900,
        );

        checkOutResponse.value = body;

        print(response.body);


      }

    } catch (e) {

      print(e);

    }finally{

      isLoading.value = false;

    }

  }


  ///Session Manage
  Timer? _timer;

  final remainingSeconds = 0.obs;
  final isSessionExpired = false.obs;

  /// API response se call karo
  void startSession(int ttlSeconds) {
    _timer?.cancel();

    remainingSeconds.value = ttlSeconds;
    isSessionExpired.value = false;

    _timer = Timer.periodic(
      const Duration(seconds: 1), (timer) {
        if (remainingSeconds.value <= 0) {
          timer.cancel();
          onSessionExpired();
        } else {
          remainingSeconds.value--;
        }
      },
    );
  }

  void onSessionExpired() {

    isSessionExpired.value = true;

    CommonDialogs().showSessionExpiredDialog();

  }

  String get formattedTime {
    final minutes = remainingSeconds.value ~/ 60;
    final seconds = remainingSeconds.value % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }


  /// Guest Details Controller

  final fullNameController = TextEditingController().obs;

  final emailController = TextEditingController().obs;

  final mobileNumberController = TextEditingController().obs;

  /// Add-ons & Preferences Controller

  final gstinNumberController = TextEditingController().obs;

  final companyNameController = TextEditingController().obs;

  final companyAddressController = TextEditingController().obs;

  final requestController = TextEditingController().obs;

  /// Coupons And Offers Controller

  final couponController = TextEditingController().obs;

  final couponLengthIs = false.obs;



  RxBool isLoadingCoupons = false.obs;
  RxBool isValidatingCoupon = false.obs;

  RxList<dynamic> coupons = [].obs;

  RxString selectedCoupon = ''.obs;

  RxDouble discountAmount = 0.0.obs;


  final OfferService offerService = chopperClient.getService<OfferService>();

  Future<void> getCoupons() async {
    try {

      isLoadingCoupons.value = true;

      final response = await offerService.getCoupons();

      if (response.isSuccessful) {

        final List list = response.body;

        coupons.value = list;
      }

    } catch (e) {


    } finally {

      isLoadingCoupons.value = false;

    }
  }

  Future<void> validateCoupon({
    required String couponCode,
    required double bookingAmount,
    required String hotelId,
    required String roomId,
  }) async {
    try {

      isValidatingCoupon.value = true;

      Loading().onLoading();

      final request = ValidateCouponRequest(
        code: couponCode,
        bookingAmount: bookingAmount,
        hotelId: hotelId,
        roomId: roomId,
      );

      final response = await offerService.validateCoupon(request.toJson(),);

      if (response.isSuccessful) {

        final data = response.body as Map<String, dynamic>;

        discountAmount.value = (data['discountAmount'] ?? 0).toDouble();

        selectedCoupon.value = couponCode;

        AppToast.show(
          message: "Coupon Applied Successfully",
          type: AppToastType.success,
        );


      }
    } catch (e) {

      AppToast.show(
        message: "Coupon Error",
        type: AppToastType.error,
      );

    } finally {

      isValidatingCoupon.value = false;

      Loading().onDone();

    }
  }


  final isBookingLoading = false.obs;

  final BookingService bookingService = chopperClient.getService<BookingService>();

  final globalKey = GlobalKey<FormState>().obs;

  Future<void> createBooking() async {
    try {

      if(globalKey.value.currentState!.validate()){

        Loading().onLoading();

        final body = {
          "fullName": fullNameController.value.text.trim(),
          "email": emailController.value.text.trim(),
          "mobile": mobileNumberController.value.text.trim(),
          "gstNumber": gstinNumberController.value.text.trim(),
          "companyName": companyNameController.value.text.trim(),
          "companyAddress": companyAddressController.value.text.trim(),
          "specialRequest": requestController.value.text.trim(),
          "roomId": allCheckoutData['roomId']?.toString(),
          "ratePlanId": allCheckoutData['ratePlanId']?.toString(),
          "propertyId": propertyData.value.id.toString(),
          "paymentMethod": selectedPayment.value==0?"payNow":"", ///Online Payment => "payNow"
          "bookingToken": checkOutResponse['token'],
          "payloadData":{
            "searchCriteria":allCheckoutData['searchCriteria'],
            "preferences": {

              "sorting": {
                "field": "Ranking",
                "order": "Desc"
              },

              "pagination": {
                "page": 1,
                "size": 45
              }
            },
            "requestHeader": {

              "requestId": DateTime.now().millisecondsSinceEpoch.toString(),

              "timestamp": DateTime.now().toUtc().toIso8601String(),

              "source": {
                "platform": "Mobile",
                "deviceType": "Android",
                "ipAddress": "0.0.0.0",
                "locale": "en-gb",
                "currency": "INR"
              }
            },
            "userContext": {
              "isUserLoggedIn": SessionManager.instance.isLoggedIn,
              "travellerType": "Standard"
            }
          }
        };

        final response = await bookingService.createBooking(body);

        if (response.isSuccessful) {

          final data = response.body as Map<String, dynamic>;

          AppToast.show(
            message: "${data["message"]}",
            type: AppToastType.success,
          );


          Get.log("Booking Success => $data");


        }

      }

    } catch (e) {

      Get.snackbar(
        "Error",
        e.toString(),
      );

    } finally {

      Loading().onDone();

    }
  }

}
