// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pointer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pointer _$PointerFromJson(Map<String, dynamic> json) => Pointer()
  ..type = $enumDecode(_$DataTypeEnumMap, json['type'])
  ..id = json['id'] as String;

Map<String, dynamic> _$PointerToJson(Pointer instance) => <String, dynamic>{
      'type': _$DataTypeEnumMap[instance.type],
      'id': instance.id,
    };

const _$DataTypeEnumMap = {
  DataType.photos: 'photos',
  DataType.authors: 'authors',
  DataType.countries: 'countries',
  DataType.books: 'books',
  DataType.series: 'series',
  DataType.chapters: 'chapters',
};
