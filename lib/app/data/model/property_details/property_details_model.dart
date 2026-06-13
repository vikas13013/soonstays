/// id : "ec529d8b-af78-43fb-b220-5ab461a07277"
/// country_id : "101"
/// state_id : "4039"
/// city_id : "132166"
/// unique_id : "bc392d7b-b955-4470-b732-2a4e97f324c1"
/// display_name : "Hotel Konark Nest"
/// description : "Welcome to Hotel Konark Nest, where comfort meets convenience in the heart of the city. Designed for both business and leisure travelers, we offers a warm, welcoming stay with modern amenities and personalized hospitality. "
/// built_year : "2024"
/// property_type : "Hotel"
/// check_in : "12:00 PM"
/// check_out : "11:00 AM"
/// full_address : "786, Scheme No 78 - II, Sector B, Vijay Nagar"
/// locality : ""
/// latitude : "22.764360"
/// longitude : "75.886980"
/// pincode : "452010"
/// tags : ["Couple Friendly","Women Friendly","Corporate Preferred"]
/// rating : "4.9"
/// policy : "<p>Must Read Rules</p>\n<ul>\n<li>Primary Guest should be atleast 18 years of age.</li>\n<li>Passport, Aadhaar, Driving License and Govt. ID are accepted as ID proof(s)</li>\n<li>Pets are not allowed</li>\n<li>Smoking within the premises is not allowed</li>\n</ul>\n<p>Guest Profile</p>\n<ul>\n<li>Unmarried couples allowed</li>\n<li>Primary guest should be atleast 18 years of age</li>\n</ul>\n<p>Guest Profile (Hourly)</p>\n<ul>\n<li>Unmarried couples are allowed in hourly stay rooms</li>\n</ul>\n<p>ID Proof Related</p>\n<ul>\n<li>Passport, Aadhaar, Driving License and Govt. ID are accepted as ID proof(s)</li>\n<li>Local ids not allowed</li>\n</ul>\n<p>Smoking/Alcohol consumption Rules</p>\n<ul>\n<li>Alcohol consumption is not allowed within the property premises.</li>\n<li>Smoking within the premises is not allowed</li>\n</ul>\n<p>Food Arrangement</p>\n<ul>\n<li>Non veg food is allowed</li>\n<li>Outside food is allowed</li>\n<li>Food Delivery is available</li>\n</ul>\n<p>Property Accessibility</p>\n<ul>\n<li>This property is not accessible to guests who use a wheelchair. Please make arrangements accordingly.</li>\n</ul>\n<p>Pet(s) Related</p>\n<ul>\n<li>Pets are not allowed</li>\n<li>There are no pets living on the property</li>\n</ul>\n<p>Other Rules</p>\n<ul>\n<li>Does not allow private parties or events</li>\n<li>Guests are requested not to invite outside visitors in the room during their stay.</li>\n</ul>\n<p>Child &amp; Extra Bed Policy</p>\n<ul>\n<li>An extra bed will be provided to accommodate any child included in the booking for a charge mentioned below.</li>\n</ul>\n"
/// stars : "3"
/// no_restrorant : "1"
/// city_name : "Indore"
/// state_name : "Madhya Pradesh"
/// country_name : "India"
/// amenities : []

class PropertyDetailsModel {
  PropertyDetailsModel({
      String? id, 
      String? countryId, 
      String? stateId, 
      String? cityId, 
      String? uniqueId, 
      String? displayName, 
      String? description, 
      String? builtYear, 
      String? propertyType, 
      String? checkIn, 
      String? checkOut, 
      String? fullAddress, 
      String? locality, 
      String? latitude, 
      String? longitude, 
      String? pincode, 
      List<String>? tags, 
      String? rating, 
      String? policy, 
      String? stars, 
      String? noRestrorant, 
      String? cityName, 
      String? stateName, 
      String? countryName, 
      List<dynamic>? amenities,}){
    _id = id;
    _countryId = countryId;
    _stateId = stateId;
    _cityId = cityId;
    _uniqueId = uniqueId;
    _displayName = displayName;
    _description = description;
    _builtYear = builtYear;
    _propertyType = propertyType;
    _checkIn = checkIn;
    _checkOut = checkOut;
    _fullAddress = fullAddress;
    _locality = locality;
    _latitude = latitude;
    _longitude = longitude;
    _pincode = pincode;
    _tags = tags;
    _rating = rating;
    _policy = policy;
    _stars = stars;
    _noRestrorant = noRestrorant;
    _cityName = cityName;
    _stateName = stateName;
    _countryName = countryName;
    _amenities = amenities;
}

  PropertyDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _countryId = json['country_id'];
    _stateId = json['state_id'];
    _cityId = json['city_id'];
    _uniqueId = json['unique_id'];
    _displayName = json['display_name'];
    _description = json['description'];
    _builtYear = json['built_year'];
    _propertyType = json['property_type'];
    _checkIn = json['check_in'];
    _checkOut = json['check_out'];
    _fullAddress = json['full_address'];
    _locality = json['locality'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _pincode = json['pincode'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _rating = json['rating'];
    _policy = json['policy'];
    _stars = json['stars'];
    _noRestrorant = json['no_restrorant'];
    _cityName = json['city_name'];
    _stateName = json['state_name'];
    _countryName = json['country_name'];
    if (json['amenities'] != null) {
      _amenities = [];
      json['amenities'].forEach((v) {
        _amenities?.add(v);
      });
    }
  }
  String? _id;
  String? _countryId;
  String? _stateId;
  String? _cityId;
  String? _uniqueId;
  String? _displayName;
  String? _description;
  String? _builtYear;
  String? _propertyType;
  String? _checkIn;
  String? _checkOut;
  String? _fullAddress;
  String? _locality;
  String? _latitude;
  String? _longitude;
  String? _pincode;
  List<String>? _tags;
  String? _rating;
  String? _policy;
  String? _stars;
  String? _noRestrorant;
  String? _cityName;
  String? _stateName;
  String? _countryName;
  List<dynamic>? _amenities;
PropertyDetailsModel copyWith({  String? id,
  String? countryId,
  String? stateId,
  String? cityId,
  String? uniqueId,
  String? displayName,
  String? description,
  String? builtYear,
  String? propertyType,
  String? checkIn,
  String? checkOut,
  String? fullAddress,
  String? locality,
  String? latitude,
  String? longitude,
  String? pincode,
  List<String>? tags,
  String? rating,
  String? policy,
  String? stars,
  String? noRestrorant,
  String? cityName,
  String? stateName,
  String? countryName,
  List<dynamic>? amenities,
}) => PropertyDetailsModel(  id: id ?? _id,
  countryId: countryId ?? _countryId,
  stateId: stateId ?? _stateId,
  cityId: cityId ?? _cityId,
  uniqueId: uniqueId ?? _uniqueId,
  displayName: displayName ?? _displayName,
  description: description ?? _description,
  builtYear: builtYear ?? _builtYear,
  propertyType: propertyType ?? _propertyType,
  checkIn: checkIn ?? _checkIn,
  checkOut: checkOut ?? _checkOut,
  fullAddress: fullAddress ?? _fullAddress,
  locality: locality ?? _locality,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  pincode: pincode ?? _pincode,
  tags: tags ?? _tags,
  rating: rating ?? _rating,
  policy: policy ?? _policy,
  stars: stars ?? _stars,
  noRestrorant: noRestrorant ?? _noRestrorant,
  cityName: cityName ?? _cityName,
  stateName: stateName ?? _stateName,
  countryName: countryName ?? _countryName,
  amenities: amenities ?? _amenities,
);
  String? get id => _id;
  String? get countryId => _countryId;
  String? get stateId => _stateId;
  String? get cityId => _cityId;
  String? get uniqueId => _uniqueId;
  String? get displayName => _displayName;
  String? get description => _description;
  String? get builtYear => _builtYear;
  String? get propertyType => _propertyType;
  String? get checkIn => _checkIn;
  String? get checkOut => _checkOut;
  String? get fullAddress => _fullAddress;
  String? get locality => _locality;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get pincode => _pincode;
  List<String>? get tags => _tags;
  String? get rating => _rating;
  String? get policy => _policy;
  String? get stars => _stars;
  String? get noRestrorant => _noRestrorant;
  String? get cityName => _cityName;
  String? get stateName => _stateName;
  String? get countryName => _countryName;
  List<dynamic>? get amenities => _amenities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['country_id'] = _countryId;
    map['state_id'] = _stateId;
    map['city_id'] = _cityId;
    map['unique_id'] = _uniqueId;
    map['display_name'] = _displayName;
    map['description'] = _description;
    map['built_year'] = _builtYear;
    map['property_type'] = _propertyType;
    map['check_in'] = _checkIn;
    map['check_out'] = _checkOut;
    map['full_address'] = _fullAddress;
    map['locality'] = _locality;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['pincode'] = _pincode;
    map['tags'] = _tags;
    map['rating'] = _rating;
    map['policy'] = _policy;
    map['stars'] = _stars;
    map['no_restrorant'] = _noRestrorant;
    map['city_name'] = _cityName;
    map['state_name'] = _stateName;
    map['country_name'] = _countryName;
    if (_amenities != null) {
      map['amenities'] = _amenities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}