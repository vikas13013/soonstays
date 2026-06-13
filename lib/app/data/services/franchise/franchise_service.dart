import 'package:chopper/chopper.dart';
import '../../../../core/constants/api_constants.dart';

part 'franchise_service.chopper.dart';

@ChopperApi()
abstract class FranchiseService extends ChopperService {

  @POST(path: ApiConstants.franchise)
  Future<Response> submitFranchise(
      @Body() Map<String, dynamic> body,
      );

  static FranchiseService create([
    ChopperClient? client,
  ]) => _$FranchiseService(client);
}