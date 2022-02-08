import 'models.dart';

class Country extends GenericDataModel {
  Country();

  late String name;

  factory Country.fromJson(Map<String, dynamic> json) => Country()
    ..type = DataTypeExtension.tryParse(json['type'])
    ..id = json['id'] as String
    ..relationships = GenericDataModel.returnPointers(json['relationships'] as Map<String, dynamic>?)
    ..name = json['attributes']['name'] as String;
}
