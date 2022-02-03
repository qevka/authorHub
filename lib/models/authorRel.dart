import 'package:json_annotation/json_annotation.dart';

part 'authorRel.g.dart';

@JsonSerializable()
class AuthorRel {
  AuthorRel();

  late Map<String,dynamic> photos;
  late Map<String,dynamic> books;
  
  factory AuthorRel.fromJson(Map<String,dynamic> json) => _$AuthorRelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorRelToJson(this);
}
