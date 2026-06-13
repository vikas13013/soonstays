import 'package:chopper/chopper.dart';
import '../../../../core/constants/api_constants.dart';

part 'policies_service.chopper.dart';

@ChopperApi()
abstract class CmsService extends ChopperService {

  @GET(path: '${ApiConstants.cancellationPolicy}')
  Future<Response<String>> getCancellationPolicy();

  @GET(path: '${ApiConstants.privacyPolicy}')
  Future<Response<String>> getPrivacyPolicy();

  @GET(path: '${ApiConstants.termsConditions}')
  Future<Response<String>> getTermsConditions();

  @GET(path: '${ApiConstants.legalPolicy}')
  Future<Response<String>> getLegalPrivacy();

  static CmsService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(
        ApiConstants.cmsBaseUrl,
      ),
      services: [
        _$CmsService(),
      ],
      converter: const JsonConverter(),
    );

    return _$CmsService(client);
  }

}
