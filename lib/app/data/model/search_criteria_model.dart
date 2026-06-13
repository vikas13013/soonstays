class SearchCriteriaModel {

  double? latitude;
  double? longitude;
  double? radiusKm;

  String? destinationType;
  String? destinationId;

  String? checkIn;
  String? checkOut;
  int? lengthOfStay;

  int? totalRooms;
  int? totalAdults;
  int? totalChildren;

  List<int>? childAges;

  SearchCriteriaModel({
    this.latitude,
    this.longitude,
    this.radiusKm,
    this.destinationType,
    this.destinationId,
    this.checkIn,
    this.checkOut,
    this.lengthOfStay,
    this.totalRooms,
    this.totalAdults,
    this.totalChildren,
    this.childAges,
  });

  Map<String, dynamic> toJson() {
    return {
      "basic": {
        "latitude":latitude??0.0,
        "longitude":longitude??0.0,
        "radius_km":radiusKm??100
      },
      "destination": {
        "type": destinationType,
        "id": destinationId,
      },
      "timeline": {
        "checkIn": checkIn,
        "checkOut": checkOut,
        "lengthOfStay": lengthOfStay,
      },
      "occupancy": {
        "totalRooms": totalRooms??1,
        "totalAdults": totalAdults??1,
        "totalChildren": totalChildren,
        "childAges": childAges ?? [],
      }
    };
  }
}