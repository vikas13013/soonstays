import 'package:chopper/chopper.dart';
import '../../../../core/constants/api_constants.dart';

part 'property_services.chopper.dart';

@ChopperApi()
abstract class PropertyServices extends ChopperService {

  @Post(
    path: "${ApiConstants.propertyList}",
  )
  Future<Response> searchHotel(

      @Body()
      Map<String, dynamic> body,

      );

  static PropertyServices create() {

    final client = ChopperClient(

      baseUrl: Uri.parse(
        "${ApiConstants.baseUrl}",
      ),

      services: [
        _$PropertyServices(),
      ],

      converter: const JsonConverter(),

    );

    return _$PropertyServices(client);
  }
}