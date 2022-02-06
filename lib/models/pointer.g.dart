// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pointer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pointer _$PointerFromJson(Map<String, dynamic> json) => Pointer()
  ..type = $enumDecodeNullable(_$DataTypeEnumMap, json['type'])
  ..id = json['id'] as String;

Map<String, dynamic> _$PointerToJson(Pointer instance) => <String, dynamic>{
      'type': _$DataTypeEnumMap[instance.type],
      'id': instance.id,
    };

const _$DataTypeEnumMap = {
  DataType.author: 'author',
  DataType.authors: 'authors',
  DataType.book: 'book',
  DataType.books: 'books',
  DataType.chapters: 'chapters',
  DataType.countries: 'countries',
  DataType.photos: 'photos',
  DataType.series: 'series',
  DataType.stores: 'stores',
};
