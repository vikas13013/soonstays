import 'package:chopper/chopper.dart';
import '../../../../core/constants/api_constants.dart';

part 'travel_agent_service.chopper.dart';

@ChopperApi()
abstract class TravelAgentService
    extends ChopperService {

  @POST(path: ApiConstants.travelAgent)
  Future<Response> submitTravelAgent(
      @Body() Map<String, dynamic> body,
      );

  static TravelAgentService create([
    ChopperClient? client,
  ]) =>
      _$TravelAgentService(client);
}