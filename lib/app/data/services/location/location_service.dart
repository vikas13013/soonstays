import 'package:chopper/chopper.dart';
import '../../../../core/constants/api_constants.dart';

part 'location_service.chopper.dart';

@ChopperApi()
abstract class LocationService
    extends ChopperService {

  @Post(
    path: ApiConstants.locationSearch,
  )
  Future<Response> getLocations(

      @Body()
      Map<String, dynamic> body,
      );



  static LocationService create() {

    final client = ChopperClient(

      baseUrl: Uri.parse(
        ApiConstants.baseUrl,
      ),

      services: [
        _$LocationService(),
      ],

      converter: const JsonConverter(),

      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );

    return _$LocationService(client);
  }
}