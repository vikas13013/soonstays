import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {

  final String? id;
  final String? label;
  final String? type;

  LocationModel({
    this.id,
    this.label,
    this.type,
  });

  factory LocationModel.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocationModelToJson(this);
}