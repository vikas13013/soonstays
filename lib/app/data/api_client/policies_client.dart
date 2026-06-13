
import 'package:chopper/chopper.dart';
import 'package:soonstays/app/data/services/policies/policies_service.dart';
import 'package:soonstays/core/constants/api_constants.dart';

import '../../../core/network/error_interceptor.dart';

final policiesClient = ChopperClient(
  baseUrl: Uri.parse(
    "${ApiConstants.cmsBaseUrl}",
  ),

  services: [
    CmsService.create(),
  ],

  converter: const JsonConverter(),

  interceptors: [

    ErrorInterceptor(),

    HttpLoggingInterceptor(),

  ],
);