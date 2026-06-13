import 'package:chopper/chopper.dart';
import 'package:soonstays/core/constants/api_constants.dart';

part 'offer_service.chopper.dart';

@ChopperApi()
abstract class OfferService extends ChopperService {

  @GET(path: ApiConstants.coupons)
  Future<Response> getCoupons();

  @POST(path: ApiConstants.validateCoupons)
  Future<Response> validateCoupon(
      @Body() Map<String, dynamic> body,
      );

  static OfferService create([ChopperClient? client]) =>
      _$OfferService(client);
}