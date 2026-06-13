import '../services/property/property_services.dart';

class PropertyRepository {

  final PropertyServices service = PropertyServices.create();

  Future getProperty(Map<String,dynamic> payload) async {

    final response = await service.searchHotel(
      payload,
    );

    return response;
  }
}