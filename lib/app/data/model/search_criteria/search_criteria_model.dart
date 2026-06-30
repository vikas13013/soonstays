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

  factory SearchCriteriaModel.fromJson(Map<String, dynamic> json) {
    return SearchCriteriaModel(
      latitude: (json["basic"]?["latitude"] as num?)?.toDouble(),
      longitude: (json["basic"]?["longitude"] as num?)?.toDouble(),
      radiusKm: (json["basic"]?["radius_km"] as num?)?.toDouble(),

      destinationType: json["destination"]?["type"],
      destinationId: json["destination"]?["id"],

      checkIn: json["timeline"]?["checkIn"],
      checkOut: json["timeline"]?["checkOut"],
      lengthOfStay: json["timeline"]?["lengthOfStay"],

      totalRooms: json["occupancy"]?["totalRooms"],
      totalAdults: json["occupancy"]?["totalAdults"],
      totalChildren: json["occupancy"]?["totalChildren"],

      childAges: (json["occupancy"]?["childAges"] as List?)
          ?.map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "basic": {
        "latitude": latitude ?? 0.0,
        "longitude": longitude ?? 0.0,
        "radius_km": radiusKm ?? 100,
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
        "totalRooms": totalRooms ?? 1,
        "totalAdults": totalAdults ?? 1,
        "totalChildren": totalChildren,
        "childAges": childAges ?? [],
      },
    };
  }
}