import 'package:author_hub/models/attributes/attribute_base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_attributes.g.dart';

@JsonSerializable()
class CountryAttributes extends Attribute {
  CountryAttributes();

  late String name;

  factory CountryAttributes.fromJson(Map<String, dynamic> json) => _$CountryAttributesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CountryAttributesToJson(this);
}
