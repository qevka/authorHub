import 'models.dart';

class Store extends GenericDataModel {
  Store();

  late String name;
  late String address;
  late num createdBy;

  factory Store.fromJson(Map<String, dynamic> json) => Store()
    ..type = DataTypeExtension.tryParse(json['type'])
    ..id = json['id'] as String
    ..relationships = GenericDataModel.returnPointers(json['relationships'] as Map<String, dynamic>?)
    ..name = json['attributes']['name'] as String
    ..address = json['attributes']['address'] as String
    ..createdBy = json['attributes']['created_by'] as num;
}
