import 'package:author_hub/models/attributes/attribute_base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chapter_attributes.g.dart';

@JsonSerializable()
class ChapterAttributes extends Attribute {
  ChapterAttributes();

  late String title;
  late num ordering;

  factory ChapterAttributes.fromJson(Map<String, dynamic> json) => _$ChapterAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterAttributesToJson(this);
}
