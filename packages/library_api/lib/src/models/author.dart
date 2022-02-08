import 'models.dart';

class Author extends GenericDataModel {
  Author();

  late String? name;
  late String? birthplace;

  /// [dob] - Date of birth
  late String? dob;

  /// [dod] - Date of death
  late String? dod;

  factory Author.fromJson(Map<String, dynamic> json) => Author()
    ..type = DataTypeExtension.tryParse(json['type'])
    ..id = json['id'] as String
    ..relationships = GenericDataModel.returnPointers(json['relationships'] as Map<String, dynamic>?)
    ..name = json['attributes']['name'] as String?
    ..birthplace = json['attributes']['birthplace'] as String?
    ..dob = json['attributes']['date_of_birth'] as String?
    ..dod = json['attributes']['date_of_death'] as String?;
}
