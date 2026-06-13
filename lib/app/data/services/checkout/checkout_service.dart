import 'package:chopper/chopper.dart';
import '../../../../core/constants/api_constants.dart';

part 'checkout_service.chopper.dart';

@ChopperApi()
abstract class CheckoutService
    extends ChopperService {

  @Post(
    path: ApiConstants.checkOut,
  )
  Future<Response> checkout(
      @Body() Map<String, dynamic> body,
      );

  static CheckoutService create([
    ChopperClient? client,
  ]) =>
      _$CheckoutService(client);
}