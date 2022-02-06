import 'package:author_hub/models/attributes/attribute_base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store_attributes.g.dart';

@JsonSerializable()
class StoreAttributes extends Attribute {
  StoreAttributes();

  late String name;
  late String address;
  @JsonKey(name: "created_by")
  late num createdBy;

  factory StoreAttributes.fromJson(Map<String, dynamic> json) => _$StoreAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$StoreAttributesToJson(this);
}
