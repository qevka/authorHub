// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreAttributes _$StoreAttributesFromJson(Map<String, dynamic> json) =>
    StoreAttributes()
      ..name = json['name'] as String
      ..address = json['address'] as String
      ..createdBy = json['created_by'] as num;

Map<String, dynamic> _$StoreAttributesToJson(StoreAttributes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'created_by': instance.createdBy,
    };
