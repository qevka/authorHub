import 'package:author_hub/models/attributes/attribute_base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_attributes.g.dart';

@JsonSerializable()
class PhotoAttributes extends Attribute {
  PhotoAttributes();

  late String title;
  late String uri;

  factory PhotoAttributes.fromJson(Map<String, dynamic> json) => _$PhotoAttributesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PhotoAttributesToJson(this);
}
