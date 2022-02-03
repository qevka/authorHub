import 'package:json_annotation/json_annotation.dart';

part 'authorAttributes.g.dart';

@JsonSerializable()
class AuthorAttributes {
  AuthorAttributes();

  late String name;
  late String birthplace;
  late String date_of_birth;
  late String date_of_death;
  
  factory AuthorAttributes.fromJson(Map<String,dynamic> json) => _$AuthorAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorAttributesToJson(this);
}
