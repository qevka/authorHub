import 'package:author_hub/models/pointer.dart';

import 'attributes/attribute_base.dart';
import 'data_types.dart';

class GenericDataModel<A extends Attribute> {
  GenericDataModel();

  late DataType type;
  late String id;
  // key attributes of an author.
  late A? attributes;

  List<Pointer> relationships = [];

  List<Pointer>? getPointer({required DataType ofType}) {
    return relationships.where((element) => element.type == ofType).toList();
  }

  GenericDataModel.fromJson(Map<String, dynamic> json) {
    DataType type = DataTypeExtension.tryParse(json["type"]);
    this.type = type;
    id = json['id'] as String;
    attributes = attributeFromDataType(json: json['attributes'] as Map<String, dynamic>, type: type) as A;
    relationships = _returnPointers(json['relationships']);
  }

  Map<String, dynamic> toJson(GenericDataModel instance) => <String, dynamic>{
        'type': instance.type.stringVal,
        'id': instance.id,
        'attributes': instance.attributes,
        'relationships': instance.relationships,
      };

  Attribute? attributeFromDataType({required Map<String, dynamic> json, required DataType type}) {
    switch (type) {
      case DataType.author:
        return AuthorAttributes.fromJson(json);
      case DataType.authors:
        return AuthorAttributes.fromJson(json);
      case DataType.photos:
        return PhotoAttributes.fromJson(json);
      case DataType.countries:
        return CountryAttributes.fromJson(json);
      case DataType.chapters:
        return ChapterAttributes.fromJson(json);
      case DataType.books:
        return BookAttributes.fromJson(json);
      case DataType.series:
        return SeriesAttributes.fromJson(json);
      default:
        return null;
    }
  }

  /// In the json data each of the pointers are wrapped with a data list or data element.
  /// These functions remove those elements and directly construct the pointers.
  static List<Pointer> _returnPointers(Map<String, dynamic> json) {
    List<Pointer> pointers = [];
    // if multi-pointer add all to list.
    json.forEach((k, v) {
      var rawPointer = v['data'];
      if (rawPointer is List) {
        for (var pointer in rawPointer) {
          pointers.add(Pointer.fromJson(pointer));
        }
        // if single pointer add to list
      } else {
        pointers.add(Pointer.fromJson(v));
      }
    });
    return pointers;
  }
}
