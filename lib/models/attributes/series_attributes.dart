import 'package:author_hub/models/attributes/attribute_base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'series_attributes.g.dart';

@JsonSerializable()
class SeriesAttributes extends Attribute {
  SeriesAttributes();

  late String title;

  factory SeriesAttributes.fromJson(Map<String, dynamic> json) => _$SeriesAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$SeriesAttributesToJson(this);
}
