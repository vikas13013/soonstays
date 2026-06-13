class ValidateCouponRequest {
  String code;
  double bookingAmount;
  String hotelId;
  String roomId;

  ValidateCouponRequest({
    required this.code,
    required this.bookingAmount,
    required this.hotelId,
    required this.roomId,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "bookingAmount": bookingAmount,
      "hotelId": hotelId,
      "roomId": roomId,
    };
  }
}