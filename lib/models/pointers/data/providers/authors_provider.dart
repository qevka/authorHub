import 'dart:convert';

import 'package:author_hub/models/attributes/attribute_base.dart';
import 'package:author_hub/models/data_types.dart';
import 'package:author_hub/models/generic_data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthorsProvider extends GetConnect {
  late String _baseUrl = 'https://jsonapiplayground.reyesoft.com/v2/';
  final http.Client client;

  AuthorsProvider({required this.client});

  @override
  void onInit() {
    _baseUrl = 'https://jsonapiplayground.reyesoft.com/v2/';
  }

  Future<List<GenericDataModel<AuthorAttributes>?>> getAuthors() async {
    final response = await client.get(Uri.parse(DataType.author.url));
    List<GenericDataModel<AuthorAttributes>> models = [];
    jsonDecode(response.body)['data'].forEach((model) => models.add(GenericDataModel<AuthorAttributes>.fromJson(model)));
    return models;
  }

  // Future<GenericDataModel<BookAttributes, BookRelationship>> getBooks() async {
  //   final response = await get('books');
  //   print(response.body);
  //   return response.body;
  // }
  //
  // Future<GenericDataModel<SeriesAttributes, SeriesRelationship>> getSeries() async {
  //   final response = await get('series');
  //   print(response.body);
  //   return response.body;
  // }
}
