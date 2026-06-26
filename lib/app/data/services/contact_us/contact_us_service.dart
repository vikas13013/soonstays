import 'package:chopper/chopper.dart';
import '../../../../core/constants/api_constants.dart';

part 'contact_us_service.chopper.dart';

@ChopperApi()
abstract class ContactUsService extends ChopperService {

  @POST(path: ApiConstants.contactUs)
  Future<Response> submitContact(
      @Body() Map<String, dynamic> body,
      );

  static ContactUsService create([
    ChopperClient? client,
  ]) => _$ContactUsService(client);
}