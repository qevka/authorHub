import 'package:author_hub/models/generic_data_model.dart';

class Photo extends GenericDataModel {
  Photo();

  late String title;
  late String uri;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo()
    ..type = DataTypeExtension.tryParse(json['type'])
    ..id = json['id'] as String
    ..relationships = GenericDataModel.returnPointers(json['relationships'] as Map<String, dynamic>?)
    ..title = json['attributes']['title'] as String
    ..uri = json['attributes']['uri'] as String;
}
