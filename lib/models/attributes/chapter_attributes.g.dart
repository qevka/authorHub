// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterAttributes _$ChapterAttributesFromJson(Map<String, dynamic> json) =>
    ChapterAttributes()
      ..title = json['title'] as String
      ..ordering = json['ordering'] as num;

Map<String, dynamic> _$ChapterAttributesToJson(ChapterAttributes instance) =>
    <String, dynamic>{
      'title': instance.title,
      'ordering': instance.ordering,
    };
