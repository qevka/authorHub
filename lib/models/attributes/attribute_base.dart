export 'author_attributes.dart';
export 'book_attributes.dart';
export 'chapter_attributes.dart';
export 'country_attributes.dart';
export 'photo_attributes.dart';
export 'series_attributes.dart';
export 'store_attributes.dart';

abstract class Attribute {
  Map<String, dynamic> toJson();
}
