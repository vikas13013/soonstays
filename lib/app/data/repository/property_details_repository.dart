import 'package:chopper/chopper.dart';
import '../services/property_details/property_details_service.dart';

class PropertyDetailsRepository {

  final PropertyDetailsService service = PropertyDetailsService.create();

  PropertyDetailsRepository();

  Future<Response<dynamic>> getPropertyDetails(
      Map<String, dynamic> payload,
      ) {
    return service.getPropertyDetails(payload);
  }
}