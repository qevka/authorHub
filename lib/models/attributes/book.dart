import 'package:author_hub/models/generic_data_model.dart';

class Book extends GenericDataModel {
  Book();

  late String title;
  late String datePublished;
  late num isbn;

  factory Book.fromJson(Map<String, dynamic> json) => Book()
    ..type = DataTypeExtension.tryParse(json['type'])
    ..id = json['id'] as String
    ..relationships = GenericDataModel.returnPointers(json['relationships'] as Map<String, dynamic>?)
    ..title = json['attributes']['title'] as String
    ..datePublished = json['attributes']['date_published'] as String
    ..isbn = json['attributes']['isbn'] as num;
}
