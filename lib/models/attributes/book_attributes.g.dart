// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookAttributes _$BookAttributesFromJson(Map<String, dynamic> json) =>
    BookAttributes()
      ..title = json['title'] as String
      ..datePublished = json['date_published'] as String
      ..isbn = json['isbn'] as num;

Map<String, dynamic> _$BookAttributesToJson(BookAttributes instance) =>
    <String, dynamic>{
      'title': instance.title,
      'date_published': instance.datePublished,
      'isbn': instance.isbn,
    };
