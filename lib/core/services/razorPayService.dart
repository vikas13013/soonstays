import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


class RazorpayService extends GetxService {
  late Razorpay _razorpay;

  Function(PaymentSuccessResponse)? onSuccess;
  Function(PaymentFailureResponse)? onError;
  Function(ExternalWalletResponse)? onWallet;

  @override
  void onInit() {
    super.onInit();

    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handleSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handleError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleWallet);
  }

  /// 🔥 OPEN PAYMENT (ORDER ID BASED)
  void openPayment({
    required String orderId,
    required String name,
    required String email,
    required double amount,
    required String contact,
    String?description,
    Function(PaymentSuccessResponse)? onSuccess,
    Function(PaymentFailureResponse)? onError,
    Function(ExternalWalletResponse)? onWallet,
  }) {
    this.onSuccess = onSuccess;
    this.onError = onError;
    this.onWallet = onWallet;

    var options = {
      'key': "rzp_test_ST1uphxNBLIdka", // 🔑 Razorpay Key
      'order_id': orderId,         // 🔥 IMPORTANT
      'amount': (amount * 100).toInt(), // paisa me convert
      'name': '',
      'description': '',
      'prefill': {
        'contact': contact,
        'email': email,
      },
      'theme': {
        'color': '#3399cc',
      }
    };

    _razorpay.open(options);
  }

  /// 🔹 SUCCESS
  void _handleSuccess(PaymentSuccessResponse response) {
    if (onSuccess != null) onSuccess!(response);
  }

  /// 🔹 ERROR
  void _handleError(PaymentFailureResponse response) {
    if (onError != null) onError!(response);
  }

  /// 🔹 WALLET
  void _handleWallet(ExternalWalletResponse response) {
    if (onWallet != null) onWallet!(response);
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }
}