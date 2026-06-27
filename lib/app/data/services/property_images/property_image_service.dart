import 'package:chopper/chopper.dart';
import 'package:soonstays/core/constants/api_constants.dart';

part 'property_image_service.chopper.dart';

@ChopperApi()
abstract class PropertyImageService extends ChopperService {

  static PropertyImageService create([ChopperClient? client]) =>
      _$PropertyImageService(client);

  @Post(path: '${ApiConstants.propertyImages}')
  Future<Response> getPropertyImages(
      @Body() Map<String, dynamic> body,
      );
}