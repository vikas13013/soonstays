import 'package:chopper/chopper.dart';
import 'package:soonstays/core/constants/api_constants.dart';

part 'booking_service.chopper.dart';

@ChopperApi()
abstract class BookingService extends ChopperService {

  @GET(path: '${ApiConstants.myBookings}')
  Future<Response<dynamic>> getMyBookings({
    @Query('page') required int page,
    @Query('limit') required int limit,
    @Query('status') String? status,
  });

  @POST(path: "${ApiConstants.createBookings}")
  Future<Response<dynamic>> createBooking(
      @Body() Map<String, dynamic> body,
      );

  static BookingService create([ChopperClient? client]) =>
      _$BookingService(client);
}