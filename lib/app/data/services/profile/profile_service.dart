import 'package:chopper/chopper.dart';
import 'package:soonstays/core/constants/api_constants.dart';

part 'profile_service.chopper.dart';

@ChopperApi()
abstract class ProfileService extends ChopperService {

  @GET(path: '${ApiConstants.userData}')
  Future<Response> getProfile();


  @PUT(path: '${ApiConstants.updateProfile}/{id}')
  Future<Response> updateProfile(
      @Path('id') String id,
      @Body() Map<String, dynamic> body,
      );

  static ProfileService create(
      [ChopperClient? client
      ]) =>
      _$ProfileService(client);
}