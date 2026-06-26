import 'package:chopper/chopper.dart';
import '../../../../core/constants/api_constants.dart';

part 'investor_service.chopper.dart';

@ChopperApi()
abstract class InvestorService extends ChopperService {

  @POST(path: ApiConstants.investor)
  Future<Response> submitInvestor(
      @Body() Map<String, dynamic> body,
      );

  static InvestorService create([
    ChopperClient? client,
  ]) => _$InvestorService(client);
}