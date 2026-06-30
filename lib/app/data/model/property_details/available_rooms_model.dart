import 'image_items.dart';

/// available_rooms : [{"id":"2c05cd85-2150-41fb-b96b-f91be348c810","name":"Deluxe Room with Pillor","room_type":"KING","min_adults":"1","max_adults":"2","max_occupancy":"2","max_children":"0","child_config":{"max_child_age":12,"free_age_limit":5},"area_sqft":"130","bed_type":"QUEEN_BED","rate_plans":[{"id":"3954f549-146d-4f05-99eb-f21ef769ab03","name":"Breakfast Included ","meal_plan":"CP","cancellation_policy":{"refundable":true,"penalty_hours":24},"pricing":{"subTotal":1200,"taxAmount":60,"totalPayable":1260,"childCharge":0,"extraAdultCharge":0,"breakdown":[{"distribution":{"adults":1,"childrenAges":[],"totalChildrenCount":0},"roomSubTotal":1200,"roomTax":60}],"averageNightlyRate":1200},"selected":false},{"id":"8ab61f95-f7d5-4955-9896-9042459e04aa","name":"Breakfast & Dinner Veg Thali ","meal_plan":"MAP","cancellation_policy":{"refundable":true,"penalty_hours":24},"pricing":{"subTotal":1499,"taxAmount":75,"totalPayable":1574,"childCharge":0,"extraAdultCharge":0,"breakdown":[{"distribution":{"adults":1,"childrenAges":[],"totalChildrenCount":0},"roomSubTotal":1499,"roomTax":75}],"averageNightlyRate":1499},"selected":false},{"id":"9a0896fb-588a-42d0-a1d6-10c46209f20e","name":"Room Only ","meal_plan":"EP","cancellation_policy":{"refundable":true,"penalty_hours":24},"pricing":{"subTotal":998,"taxAmount":50,"totalPayable":1048,"childCharge":0,"extraAdultCharge":0,"breakdown":[{"distribution":{"adults":1,"childrenAges":[],"totalChildrenCount":0},"roomSubTotal":998,"roomTax":50}],"averageNightlyRate":998},"selected":true}]},{"id":"70f9bf09-7645-4311-940a-2862bd7be0df","name":"Premium Room","room_type":"QUEEN","min_adults":"1","max_adults":"3","max_occupancy":"5","max_children":"2","child_config":{"max_child_age":12,"free_age_limit":5},"area_sqft":"170","bed_type":"KING_BED","rate_plans":[{"id":"1b53ab1e-d5a3-474d-8879-e639d4c3891c","name":"Breakfast Included ","meal_plan":"CP","cancellation_policy":{"refundable":true,"penalty_hours":24},"pricing":{"subTotal":1599,"taxAmount":80,"totalPayable":1679,"childCharge":0,"extraAdultCharge":0,"breakdown":[{"distribution":{"adults":1,"childrenAges":[],"totalChildrenCount":0},"roomSubTotal":1599,"roomTax":80}],"averageNightlyRate":1599},"selected":false},{"id":"57b8d0a0-dca4-4fbc-a924-ffae039a2b4d","name":"Room only ","meal_plan":"EP","cancellation_policy":{"refundable":true,"penalty_hours":24},"pricing":{"subTotal":1398,"taxAmount":70,"totalPayable":1468,"childCharge":0,"extraAdultCharge":0,"breakdown":[{"distribution":{"adults":1,"childrenAges":[],"totalChildrenCount":0},"roomSubTotal":1398,"roomTax":70}],"averageNightlyRate":1398},"selected":false},{"id":"7c430dfa-17b6-48f2-8286-d37c3f5c082b","name":"Breakfast & Dinner Veg Thali ","meal_plan":"MAP","cancellation_policy":{"refundable":true,"penalty_hours":24},"pricing":{"subTotal":1799,"taxAmount":90,"totalPayable":1889,"childCharge":0,"extraAdultCharge":0,"breakdown":[{"distribution":{"adults":1,"childrenAges":[],"totalChildrenCount":0},"roomSubTotal":1799,"roomTax":90}],"averageNightlyRate":1799},"selected":false}]},{"id":"8770a634-73e1-481a-b2d1-34bfc4b18411","name":"Family Room","room_type":"FAMILY","min_adults":"1","max_adults":"4","max_occupancy":"6","max_children":"2","child_config":{"max_child_age":12,"free_age_limit":5},"area_sqft":"220","bed_type":"DOUBLE_BED","rate_plans":[{"id":"7dca70ec-1eed-4c8a-ad9b-86bc9ae001e4","name":"Breakfast & Dinner Veg Thali ","meal_plan":"MAP","cancellation_policy":{"refundable":true,"penalty_hours":24},"pricing":{"subTotal":2899,"taxAmount":145,"totalPayable":3044,"childCharge":0,"extraAdultCharge":0,"breakdown":[{"distribution":{"adults":1,"childrenAges":[],"totalChildrenCount":0},"roomSubTotal":2899,"roomTax":145}],"averageNightlyRate":2899},"selected":false},{"id":"9751b721-4d16-4d1a-b41a-be74d17721f3","name":"Breakfast Included ","meal_plan":"CP","cancellation_policy":{"refundable":true,"penalty_hours":24},"pricing":{"subTotal":2599,"taxAmount":130,"totalPayable":2729,"childCharge":0,"extraAdultCharge":0,"breakdown":[{"distribution":{"adults":1,"childrenAges":[],"totalChildrenCount":0},"roomSubTotal":2599,"roomTax":130}],"averageNightlyRate":2599},"selected":false},{"id":"f24ca08a-206c-4b29-b0d5-81457bdfd3e2","name":"Room Only ","meal_plan":"EP","cancellation_policy":{"refundable":true,"penalty_hours":24},"pricing":{"subTotal":2399,"taxAmount":120,"totalPayable":2519,"childCharge":0,"extraAdultCharge":0,"breakdown":[{"distribution":{"adults":1,"childrenAges":[],"totalChildrenCount":0},"roomSubTotal":2399,"roomTax":120}],"averageNightlyRate":2399},"selected":false}]}]

class AvailableRoomsModel {
  AvailableRoomsModel({
      List<AvailableRoomsList>? availableRooms,}){
    _availableRooms = availableRooms;
}

  AvailableRoomsModel.fromJson(dynamic json) {
    if (json['available_rooms'] != null) {
      _availableRooms = [];
      json['available_rooms'].forEach((v) {
        _availableRooms?.add(AvailableRoomsList.fromJson(v));
      });
    }
  }
  List<AvailableRoomsList>? _availableRooms;
AvailableRoomsModel copyWith({  List<AvailableRoomsList>? availableRooms,
}) => AvailableRoomsModel(  availableRooms: availableRooms ?? _availableRooms,
);
  List<AvailableRoomsList>? get availableRooms => _availableRooms;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_availableRooms != null) {
      map['available_rooms'] = _availableRooms?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "2c05cd85-2150-41fb-b96b-f91be348c810"
/// name : "Deluxe Room with Pillor"
/// room_type : "KING"
/// min_adults : "1"
/// max_adults : "2"
/// max_occupancy : "2"
/// max_children : "0"
/// child_config : {"max_child_age":12,"free_age_limit":5}
/// area_sqft : "130"
/// bed_type : "QUEEN_BED"
/// rate_plans : [{"id":"3954f549-146d-4f05-99eb-f21ef769ab03","name":"Breakfast Included ","meal_plan":"CP","cancellation_policy":{"refundable":true,"penalty_hours":24},"pricing":{"subTotal":1200,"taxAmount":60,"totalPayable":1260,"childCharge":0,"extraAdultCharge":0,"breakdown":[{"distribution":{"adults":1,"childrenAges":[],"totalChildrenCount":0},"roomSubTotal":1200,"roomTax":60}],"averageNightlyRate":1200},"selected":false},{"id":"8ab61f95-f7d5-4955-9896-9042459e04aa","name":"Breakfast & Dinner Veg Thali ","meal_plan":"MAP","cancellation_policy":{"refundable":true,"penalty_hours":24},"pricing":{"subTotal":1499,"taxAmount":75,"totalPayable":1574,"childCharge":0,"extraAdultCharge":0,"breakdown":[{"distribution":{"adults":1,"childrenAges":[],"totalChildrenCount":0},"roomSubTotal":1499,"roomTax":75}],"averageNightlyRate":1499},"selected":false},{"id":"9a0896fb-588a-42d0-a1d6-10c46209f20e","name":"Room Only ","meal_plan":"EP","cancellation_policy":{"refundable":true,"penalty_hours":24},"pricing":{"subTotal":998,"taxAmount":50,"totalPayable":1048,"childCharge":0,"extraAdultCharge":0,"breakdown":[{"distribution":{"adults":1,"childrenAges":[],"totalChildrenCount":0},"roomSubTotal":998,"roomTax":50}],"averageNightlyRate":998},"selected":true}]

class AvailableRoomsList {
  AvailableRoomsList({
      String? id, 
      String? name, 
      String? roomType, 
      String? minAdults, 
      String? maxAdults, 
      String? maxOccupancy, 
      String? maxChildren, 
      ChildConfig? childConfig, 
      String? areaSqft, 
      String? bedType, 
      List<RatePlans>? ratePlans,
      List<ImageItems>? imageItems,

  }){
    _id = id;
    _name = name;
    _roomType = roomType;
    _minAdults = minAdults;
    _maxAdults = maxAdults;
    _maxOccupancy = maxOccupancy;
    _maxChildren = maxChildren;
    _childConfig = childConfig;
    _areaSqft = areaSqft;
    _bedType = bedType;
    _ratePlans = ratePlans;
    _imageItems = imageItems;
}

  AvailableRoomsList.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _roomType = json['room_type'];
    _minAdults = json['min_adults'];
    _maxAdults = json['max_adults'];
    _maxOccupancy = json['max_occupancy'];
    _maxChildren = json['max_children'];
    _childConfig = json['child_config'] != null ? ChildConfig.fromJson(json['child_config']) : null;
    _areaSqft = json['area_sqft'];
    _bedType = json['bed_type'];
    if (json['rate_plans'] != null) {
      _ratePlans = [];
      json['rate_plans'].forEach((v) {
        _ratePlans?.add(RatePlans.fromJson(v));
      });
    }
    if (json['items'] != null) {
      _imageItems = [];
      json['items'].forEach((v) {
        _imageItems?.add(ImageItems.fromJson(v));
      });
    }
  }
  String? _id;
  String? _name;
  String? _roomType;
  String? _minAdults;
  String? _maxAdults;
  String? _maxOccupancy;
  String? _maxChildren;
  ChildConfig? _childConfig;
  String? _areaSqft;
  String? _bedType;
  List<RatePlans>? _ratePlans;
  List<ImageItems>? _imageItems;
AvailableRoomsList copyWith({  String? id,
  String? name,
  String? roomType,
  String? minAdults,
  String? maxAdults,
  String? maxOccupancy,
  String? maxChildren,
  ChildConfig? childConfig,
  String? areaSqft,
  String? bedType,
  List<RatePlans>? ratePlans,
  List<ImageItems>? imageItems,
}) => AvailableRoomsList(  id: id ?? _id,
  name: name ?? _name,
  roomType: roomType ?? _roomType,
  minAdults: minAdults ?? _minAdults,
  maxAdults: maxAdults ?? _maxAdults,
  maxOccupancy: maxOccupancy ?? _maxOccupancy,
  maxChildren: maxChildren ?? _maxChildren,
  childConfig: childConfig ?? _childConfig,
  areaSqft: areaSqft ?? _areaSqft,
  bedType: bedType ?? _bedType,
  ratePlans: ratePlans ?? _ratePlans,
  imageItems: imageItems ?? _imageItems,
);
  String? get id => _id;
  String? get name => _name;
  String? get roomType => _roomType;
  String? get minAdults => _minAdults;
  String? get maxAdults => _maxAdults;
  String? get maxOccupancy => _maxOccupancy;
  String? get maxChildren => _maxChildren;
  ChildConfig? get childConfig => _childConfig;
  String? get areaSqft => _areaSqft;
  String? get bedType => _bedType;
  List<RatePlans>? get ratePlans => _ratePlans;
  List<ImageItems>? get imageItems => _imageItems;

  set imageItems(List<ImageItems> value) {
    _imageItems = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['room_type'] = _roomType;
    map['min_adults'] = _minAdults;
    map['max_adults'] = _maxAdults;
    map['max_occupancy'] = _maxOccupancy;
    map['max_children'] = _maxChildren;
    if (_childConfig != null) {
      map['child_config'] = _childConfig?.toJson();
    }
    map['area_sqft'] = _areaSqft;
    map['bed_type'] = _bedType;
    if (_ratePlans != null) {
      map['rate_plans'] = _ratePlans?.map((v) => v.toJson()).toList();
    }
    if (_imageItems != null) {
      map['items'] = _imageItems?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "3954f549-146d-4f05-99eb-f21ef769ab03"
/// name : "Breakfast Included "
/// meal_plan : "CP"
/// cancellation_policy : {"refundable":true,"penalty_hours":24}
/// pricing : {"subTotal":1200,"taxAmount":60,"totalPayable":1260,"childCharge":0,"extraAdultCharge":0,"breakdown":[{"distribution":{"adults":1,"childrenAges":[],"totalChildrenCount":0},"roomSubTotal":1200,"roomTax":60}],"averageNightlyRate":1200}
/// selected : false

class RatePlans {
  RatePlans({
      String? id, 
      String? name, 
      String? mealPlan, 
      CancellationPolicy? cancellationPolicy, 
      Pricing? pricing, 
      bool? selected,}){
    _id = id;
    _name = name;
    _mealPlan = mealPlan;
    _cancellationPolicy = cancellationPolicy;
    _pricing = pricing;
    _selected = selected;
}

  RatePlans.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _mealPlan = json['meal_plan'];
    _cancellationPolicy = json['cancellation_policy'] != null ? CancellationPolicy.fromJson(json['cancellation_policy']) : null;
    _pricing = json['pricing'] != null ? Pricing.fromJson(json['pricing']) : null;
    _selected = json['selected'];
  }
  String? _id;
  String? _name;
  String? _mealPlan;
  CancellationPolicy? _cancellationPolicy;
  Pricing? _pricing;
  bool? _selected;
RatePlans copyWith({  String? id,
  String? name,
  String? mealPlan,
  CancellationPolicy? cancellationPolicy,
  Pricing? pricing,
  bool? selected,
}) => RatePlans(  id: id ?? _id,
  name: name ?? _name,
  mealPlan: mealPlan ?? _mealPlan,
  cancellationPolicy: cancellationPolicy ?? _cancellationPolicy,
  pricing: pricing ?? _pricing,
  selected: selected ?? _selected,
);
  String? get id => _id;
  String? get name => _name;
  String? get mealPlan => _mealPlan;
  CancellationPolicy? get cancellationPolicy => _cancellationPolicy;
  Pricing? get pricing => _pricing;
  bool? get selected => _selected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['meal_plan'] = _mealPlan;
    if (_cancellationPolicy != null) {
      map['cancellation_policy'] = _cancellationPolicy?.toJson();
    }
    if (_pricing != null) {
      map['pricing'] = _pricing?.toJson();
    }
    map['selected'] = _selected;
    return map;
  }

}

/// subTotal : 1200
/// taxAmount : 60
/// totalPayable : 1260
/// childCharge : 0
/// extraAdultCharge : 0
/// breakdown : [{"distribution":{"adults":1,"childrenAges":[],"totalChildrenCount":0},"roomSubTotal":1200,"roomTax":60}]
/// averageNightlyRate : 1200

class Pricing {
  Pricing({
      num? subTotal, 
      num? taxAmount, 
      num? totalPayable, 
      num? childCharge, 
      num? extraAdultCharge, 
      List<Breakdown>? breakdown, 
      num? averageNightlyRate,}){
    _subTotal = subTotal;
    _taxAmount = taxAmount;
    _totalPayable = totalPayable;
    _childCharge = childCharge;
    _extraAdultCharge = extraAdultCharge;
    _breakdown = breakdown;
    _averageNightlyRate = averageNightlyRate;
}

  Pricing.fromJson(dynamic json) {
    _subTotal = json['subTotal'];
    _taxAmount = json['taxAmount'];
    _totalPayable = json['totalPayable'];
    _childCharge = json['childCharge'];
    _extraAdultCharge = json['extraAdultCharge'];
    if (json['breakdown'] != null) {
      _breakdown = [];
      json['breakdown'].forEach((v) {
        _breakdown?.add(Breakdown.fromJson(v));
      });
    }
    _averageNightlyRate = json['averageNightlyRate'];
  }
  num? _subTotal;
  num? _taxAmount;
  num? _totalPayable;
  num? _childCharge;
  num? _extraAdultCharge;
  List<Breakdown>? _breakdown;
  num? _averageNightlyRate;
Pricing copyWith({  num? subTotal,
  num? taxAmount,
  num? totalPayable,
  num? childCharge,
  num? extraAdultCharge,
  List<Breakdown>? breakdown,
  num? averageNightlyRate,
}) => Pricing(  subTotal: subTotal ?? _subTotal,
  taxAmount: taxAmount ?? _taxAmount,
  totalPayable: totalPayable ?? _totalPayable,
  childCharge: childCharge ?? _childCharge,
  extraAdultCharge: extraAdultCharge ?? _extraAdultCharge,
  breakdown: breakdown ?? _breakdown,
  averageNightlyRate: averageNightlyRate ?? _averageNightlyRate,
);
  num? get subTotal => _subTotal;
  num? get taxAmount => _taxAmount;
  num? get totalPayable => _totalPayable;
  num? get childCharge => _childCharge;
  num? get extraAdultCharge => _extraAdultCharge;
  List<Breakdown>? get breakdown => _breakdown;
  num? get averageNightlyRate => _averageNightlyRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subTotal'] = _subTotal;
    map['taxAmount'] = _taxAmount;
    map['totalPayable'] = _totalPayable;
    map['childCharge'] = _childCharge;
    map['extraAdultCharge'] = _extraAdultCharge;
    if (_breakdown != null) {
      map['breakdown'] = _breakdown?.map((v) => v.toJson()).toList();
    }
    map['averageNightlyRate'] = _averageNightlyRate;
    return map;
  }

}

/// distribution : {"adults":1,"childrenAges":[],"totalChildrenCount":0}
/// roomSubTotal : 1200
/// roomTax : 60

class Breakdown {
  Breakdown({
      Distribution? distribution, 
      num? roomSubTotal, 
      num? roomTax,}){
    _distribution = distribution;
    _roomSubTotal = roomSubTotal;
    _roomTax = roomTax;
}

  Breakdown.fromJson(dynamic json) {
    _distribution = json['distribution'] != null ? Distribution.fromJson(json['distribution']) : null;
    _roomSubTotal = json['roomSubTotal'];
    _roomTax = json['roomTax'];
  }
  Distribution? _distribution;
  num? _roomSubTotal;
  num? _roomTax;
Breakdown copyWith({  Distribution? distribution,
  num? roomSubTotal,
  num? roomTax,
}) => Breakdown(  distribution: distribution ?? _distribution,
  roomSubTotal: roomSubTotal ?? _roomSubTotal,
  roomTax: roomTax ?? _roomTax,
);
  Distribution? get distribution => _distribution;
  num? get roomSubTotal => _roomSubTotal;
  num? get roomTax => _roomTax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_distribution != null) {
      map['distribution'] = _distribution?.toJson();
    }
    map['roomSubTotal'] = _roomSubTotal;
    map['roomTax'] = _roomTax;
    return map;
  }

}

/// adults : 1
/// childrenAges : []
/// totalChildrenCount : 0

class Distribution {
  Distribution({
      num? adults, 
      List<dynamic>? childrenAges, 
      num? totalChildrenCount,}){
    _adults = adults;
    _childrenAges = childrenAges;
    _totalChildrenCount = totalChildrenCount;
}

  Distribution.fromJson(dynamic json) {
    _adults = json['adults'];
    if (json['childrenAges'] != null) {
      _childrenAges = [];
      json['childrenAges'].forEach((v) {
        _childrenAges?.add(v);
      });
    }
    _totalChildrenCount = json['totalChildrenCount'];
  }
  num? _adults;
  List<dynamic>? _childrenAges;
  num? _totalChildrenCount;
Distribution copyWith({  num? adults,
  List<dynamic>? childrenAges,
  num? totalChildrenCount,
}) => Distribution(  adults: adults ?? _adults,
  childrenAges: childrenAges ?? _childrenAges,
  totalChildrenCount: totalChildrenCount ?? _totalChildrenCount,
);
  num? get adults => _adults;
  List<dynamic>? get childrenAges => _childrenAges;
  num? get totalChildrenCount => _totalChildrenCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adults'] = _adults;
    if (_childrenAges != null) {
      map['childrenAges'] = _childrenAges?.map((v) => v.toJson()).toList();
    }
    map['totalChildrenCount'] = _totalChildrenCount;
    return map;
  }

}

/// refundable : true
/// penalty_hours : 24

class CancellationPolicy {
  CancellationPolicy({
      bool? refundable, 
      num? penaltyHours,}){
    _refundable = refundable;
    _penaltyHours = penaltyHours;
}

  CancellationPolicy.fromJson(dynamic json) {
    _refundable = json['refundable'];
    _penaltyHours = json['penalty_hours'];
  }
  bool? _refundable;
  num? _penaltyHours;
CancellationPolicy copyWith({  bool? refundable,
  num? penaltyHours,
}) => CancellationPolicy(  refundable: refundable ?? _refundable,
  penaltyHours: penaltyHours ?? _penaltyHours,
);
  bool? get refundable => _refundable;
  num? get penaltyHours => _penaltyHours;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refundable'] = _refundable;
    map['penalty_hours'] = _penaltyHours;
    return map;
  }

}

/// max_child_age : 12
/// free_age_limit : 5

class ChildConfig {
  ChildConfig({
      num? maxChildAge, 
      num? freeAgeLimit,}){
    _maxChildAge = maxChildAge;
    _freeAgeLimit = freeAgeLimit;
}

  ChildConfig.fromJson(dynamic json) {
    _maxChildAge = json['max_child_age'];
    _freeAgeLimit = json['free_age_limit'];
  }
  num? _maxChildAge;
  num? _freeAgeLimit;
ChildConfig copyWith({  num? maxChildAge,
  num? freeAgeLimit,
}) => ChildConfig(  maxChildAge: maxChildAge ?? _maxChildAge,
  freeAgeLimit: freeAgeLimit ?? _freeAgeLimit,
);
  num? get maxChildAge => _maxChildAge;
  num? get freeAgeLimit => _freeAgeLimit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['max_child_age'] = _maxChildAge;
    map['free_age_limit'] = _freeAgeLimit;
    return map;
  }

}