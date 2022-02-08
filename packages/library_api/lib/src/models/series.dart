import 'models.dart';

class Series extends GenericDataModel {
  Series();

  late String title;

  factory Series.fromJson(Map<String, dynamic> json) => Series()
    ..type = DataTypeExtension.tryParse(json['type'])
    ..id = json['id'] as String
    ..relationships = GenericDataModel.returnPointers(json['relationships'] as Map<String, dynamic>?)
    ..title = json['attributes']['title'] as String;
}
