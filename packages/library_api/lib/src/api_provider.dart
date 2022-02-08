import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/models.dart';

class ApiClient {
  static final http.Client _client = http.Client();


  /// [getAuthors] returns a list of 'Authors' from the API.
  /// [page] - The page of items you would like to return (defaults to 1). But can be used for paging a list ect.
  /// [quantity] - The number of items to fetch with each page.
  static Future<List<BookAndAuthor>> getAuthors({int page = 1, int quantity = 50}) async {
    final response =
        await _client.get(Uri.parse(DataType.author.url + "?page[number]=$page&page[size]=$quantity&include=books"));
    List<BookAndAuthor> bookAndAuthors = [];
    List<Author> authors = [];
    Map<String, Book> books = {};
    jsonDecode(response.body)['data'].forEach((model) => authors.add(Author.fromJson(model)));
    for (var model in jsonDecode(response.body)['included']) {
      books[model['id']] = Book.fromJson(model);
    }
    for (var author in authors) {
      List<Book> bookz = [];
      for (var element in author.getPointer(ofType: DataType.books)!) {
        var book = books[element.id]!;
        bookz.add(book);
      }
      bookAndAuthors.add(BookAndAuthor(books: bookz, author: author));
    }
    return bookAndAuthors;
  }

  /// [getBooks] returns a list of Books from the API
  /// [page] - The page of items you would like to return (defaults to 1). But can be used for paging a list ect.
  /// [quantity] - The number of items to fetch with each page.
  static Future<List<Book>> getBooks({int page = 1, int quantity = 50}) async {
    final response = await _client.get(Uri.parse(DataType.books.url + "?page[number]=$page&page[size]=$quantity"));
    List<Book> models = [];
    jsonDecode(response.body)['data'].forEach((model) {
      var book = Book.fromJson(model);
      models.add(book);
    });
    return models;
  }

  /// [getStores] returns a list of stores from the API
  /// [page] - The page of items you would like to return (defaults to 1). But can be used for paging a list ect.
  /// [quantity] - The number of items to fetch with each page.
  static Future<List<Store>> getStores({int page = 1, int quantity = 50}) async {
    final response = await _client.get(Uri.parse(DataType.stores.url + "?page[number]=$page&page[size]=$quantity"));
    List<Store> models = [];
    for (var model in jsonDecode(response.body)['data']) {
      var store = Store.fromJson(model);
      models.add(store);
    }
    return models;
  }

  /// [getItem] returns a specific record of Type GenericDataModel<T> from the API.
  /// This can be used to lookup a book or author. Just pass it the DataType you are looking up and the Id you
  /// are looking for and it will return your item.
  ///
  /// ex.
  /// Photo photos = await getItem<Photo>(typeOf: DataType.photos, id: "1");
  /// print(photos.title);
  Future<T> getItem<T>({required DataType typeOf, required String id}) async {
    final response = await _client.get(Uri.parse(typeOf.url + "/$id"));
    return _fromJson<T>(jsonDecode(response.body)['data'], typeOf);
  }

  T _fromJson<T>(Map<String, dynamic> json, DataType type) {
    switch (type) {
      case DataType.author:
        return Author.fromJson(json) as T;
      case DataType.authors:
        return Author.fromJson(json) as T;
      case DataType.photos:
        return Photo.fromJson(json) as T;
      case DataType.countries:
        return Country.fromJson(json) as T;
      case DataType.chapters:
        return Chapter.fromJson(json) as T;
      case DataType.books:
        return Book.fromJson(json) as T;
      case DataType.series:
        return Series.fromJson(json) as T;
      default:
        throw ("invalid constructor type");
    }
  }
}
