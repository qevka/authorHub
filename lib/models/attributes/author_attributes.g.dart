// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorAttributes _$AuthorAttributesFromJson(Map<String, dynamic> json) =>
    AuthorAttributes()
      ..name = json['name'] as String
      ..birthplace = json['birthplace'] as String
      ..dob = json['date_of_birth'] as String
      ..dod = json['date_of_death'] as String;

Map<String, dynamic> _$AuthorAttributesToJson(AuthorAttributes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birthplace': instance.birthplace,
      'date_of_birth': instance.dob,
      'date_of_death': instance.dod,
    };
