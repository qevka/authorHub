import 'models.dart';

class Chapter extends GenericDataModel {
  Chapter();

  late String title;
  late num ordering;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter()
    ..type = DataTypeExtension.tryParse(json['type'])
    ..id = json['id'] as String
    ..relationships = GenericDataModel.returnPointers(json['relationships'] as Map<String, dynamic>?)
    ..title = json['attributes']['title'] as String
    ..ordering = json['attributes']['ordering'] as num;
}
