import 'package:chopper/chopper.dart';

import '../../../../core/constants/api_constants.dart';

part 'corporate_service.chopper.dart';

@ChopperApi()
abstract class CorporateService
    extends ChopperService {

  @POST(path: ApiConstants.corporate)
  Future<Response> submitCorporate(
      @Body() Map<String, dynamic> body,
      );

  static CorporateService create([
    ChopperClient? client,
  ]) =>
      _$CorporateService(client);
}