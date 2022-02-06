import 'package:author_hub/models/attributes/attribute_base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_attributes.g.dart';

@JsonSerializable()
class BookAttributes extends Attribute {
  BookAttributes();

  late String title;
  @JsonKey(name: 'date_published')
  late String datePublished;
  late num isbn;

  factory BookAttributes.fromJson(Map<String, dynamic> json) => _$BookAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$BookAttributesToJson(this);
}
