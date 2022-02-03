import 'package:get/get.dart';

import '../authors_model.dart';

class AuthorsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Authors.fromJson(map);
      if (map is List)
        return map.map((item) => Authors.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Authors?> getAuthors(int id) async {
    final response = await get('authors/$id');
    return response.body;
  }

  Future<Response<Authors>> postAuthors(Authors authors) async =>
      await post('authors', authors);
  Future<Response> deleteAuthors(int id) async => await delete('authors/$id');

  Future<Book> getBooks({int forPage}) {}

  // https://jsonapiplayground.reyesoft.com/v2/authors?filter[id]=9
  Future<Author> getAuthor({int id}){}

  Future<Book> getBook({int id}) {}

  Future<Store> getBooks({int forStore}) {}

}
