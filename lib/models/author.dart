import 'package:json_annotation/json_annotation.dart';

import "authorAttributes.dart";
import 'enums/data_types.dart';

part 'author.g.dart';

@JsonSerializable()
class Author {
  Author();

  late DataType type;
  late String id;
  // key attributes of an author.
  late AuthorAttributes attributes;
  // The ids of books and photos associated with this author.
  late Map<String, dynamic> relationships;
  late Map<String, dynamic> links;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
