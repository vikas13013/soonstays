/// id : "52dec957-b43d-4950-8f1b-e04622e9791e"
/// file_name : "1776626476109-450f867b381d72977ebdecf72e49a2c5.jpeg"
/// is_primary : false
/// content_bucket_url : "https://kehu.s3.amazonaws.com/property/025d7e77-5b8c-45cd-adcf-65107a029232/IMAGE/1776626476109-450f867b381d72977ebdecf72e49a2c5.jpeg"
/// tags : [1]
/// room : {"id":"20861a72-46d7-40da-8552-54fffc7324e0","name":"Premium Room"}

class ImageItems {
  ImageItems({
      String? id, 
      String? fileName, 
      bool? isPrimary, 
      String? contentBucketUrl, 
      List<num>? tags, 
      Room? room,}){
    _id = id;
    _fileName = fileName;
    _isPrimary = isPrimary;
    _contentBucketUrl = contentBucketUrl;
    _tags = tags;
    _room = room;
}

  ImageItems.fromJson(dynamic json) {
    _id = json['id'];
    _fileName = json['file_name'];
    _isPrimary = json['is_primary'];
    _contentBucketUrl = json['content_bucket_url'];
    _tags = json['tags'] != null ? json['tags'].cast<num>() : [];
    _room = json['room'] != null ? Room.fromJson(json['room']) : null;
  }
  String? _id;
  String? _fileName;
  bool? _isPrimary;
  String? _contentBucketUrl;
  List<num>? _tags;
  Room? _room;
ImageItems copyWith({  String? id,
  String? fileName,
  bool? isPrimary,
  String? contentBucketUrl,
  List<num>? tags,
  Room? room,
}) => ImageItems(  id: id ?? _id,
  fileName: fileName ?? _fileName,
  isPrimary: isPrimary ?? _isPrimary,
  contentBucketUrl: contentBucketUrl ?? _contentBucketUrl,
  tags: tags ?? _tags,
  room: room ?? _room,
);
  String? get id => _id;
  String? get fileName => _fileName;
  bool? get isPrimary => _isPrimary;
  String? get contentBucketUrl => _contentBucketUrl;
  List<num>? get tags => _tags;
  Room? get room => _room;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_name'] = _fileName;
    map['is_primary'] = _isPrimary;
    map['content_bucket_url'] = _contentBucketUrl;
    map['tags'] = _tags;
    if (_room != null) {
      map['room'] = _room?.toJson();
    }
    return map;
  }

}

/// id : "20861a72-46d7-40da-8552-54fffc7324e0"
/// name : "Premium Room"

class Room {
  Room({
      String? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Room.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  String? _id;
  String? _name;
Room copyWith({  String? id,
  String? name,
}) => Room(  id: id ?? _id,
  name: name ?? _name,
);
  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}