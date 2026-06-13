import 'package:chopper/chopper.dart';
import '../../../../core/constants/api_constants.dart';

part 'property_details_service.chopper.dart';

@ChopperApi()
abstract class PropertyDetailsService extends ChopperService {

  @Post(
    path: ApiConstants.propertyDetails,
  )
  Future<Response<dynamic>> getPropertyDetails(
      @Body() Map<String, dynamic> body,
      );

  static PropertyDetailsService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(ApiConstants.baseUrl),
      services: [
        _$PropertyDetailsService(),
      ],
      converter: const JsonConverter(),
    );

    return _$PropertyDetailsService(client);
  }
}