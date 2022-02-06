import 'package:author_hub/models/attributes/attribute_base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_attributes.g.dart';

@JsonSerializable()
class AuthorAttributes extends Attribute {
  AuthorAttributes();

  late String name;
  late String birthplace;

  /// [dob] - Date of birth
  @JsonKey(name: "date_of_birth")
  late String dob;

  /// [dod] - Date of death
  @JsonKey(name: "date_of_death")
  late String dod;

  factory AuthorAttributes.fromJson(Map<String, dynamic> json) => _$AuthorAttributesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AuthorAttributesToJson(this);
}
