import 'dart:convert';

import 'package:author_hub/models/attributes/author.dart';
import 'package:author_hub/models/attributes/book.dart';
import 'package:author_hub/models/attributes/chapter.dart';
import 'package:author_hub/models/attributes/country.dart';
import 'package:author_hub/models/attributes/photo.dart';
import 'package:author_hub/models/attributes/series.dart';
import 'package:author_hub/models/attributes/store.dart';
import 'package:author_hub/models/book_and_author.dart';
import 'package:author_hub/models/data_types.dart';
import 'package:author_hub/models/generic_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class ApiProvider {
  /// [bookStream] a stream of book data.
  Stream<List<Book>> get bookStream => _bookStream.stream;

  /// [authorStream] a stream of authorData
  Stream<List<BookAndAuthor>> get bookAndAuthorStream => _bookAndAuthorStream.stream;

  /// [storeStream] a stream of stores
  Stream<List<Store>> get storeStream => _storeStream.stream;

  /// Private stream controllers.
  late BehaviorSubject<List<Book>> _bookStream;
  late BehaviorSubject<List<BookAndAuthor>> _bookAndAuthorStream;
  late BehaviorSubject<List<Store>> _storeStream;

  /// [client] a client is passed into this class so that it can be easily swapped out for testing purposes.
  late final http.Client _client;

  ApiProvider._warmUp() {
    _bookStream = BehaviorSubject();
    _storeStream = BehaviorSubject();
    _bookAndAuthorStream = BehaviorSubject();
  }

  static ApiProvider instance = ApiProvider._warmUp();

  factory ApiProvider(http.Client client) {
    instance._client = client;
    instance.getBooks();
    instance.getAuthors();
    instance.getStores();
    return instance;
  }

  void dispose() {
    _bookStream.close();
    _bookAndAuthorStream.close();
    _storeStream.close();
  }

  /// [getAuthors] returns a list of 'Authors' from the API.
  /// [page] - The page of items you would like to return (defaults to 1). But can be used for paging a list ect.
  /// [quantity] - The number of items to fetch with each page.
  Future<void> getAuthors({int page = 1, int quantity = 50}) async {
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
    _bookAndAuthorStream.sink.add(bookAndAuthors);
  }

  /// [getBooks] returns a list of Books from the API
  /// [page] - The page of items you would like to return (defaults to 1). But can be used for paging a list ect.
  /// [quantity] - The number of items to fetch with each page.
  Future<List<Book>> getBooks({int page = 1, int quantity = 50}) async {
    final response = await _client.get(Uri.parse(DataType.books.url + "?page[number]=$page&page[size]=$quantity"));
    List<Book> models = [];
    jsonDecode(response.body)['data'].forEach((model) {
      var book = Book.fromJson(model);
      models.add(book);
    });

    _bookStream.sink.add(models);
    return models;
  }

  /// [getStores] returns a list of stores from the API
  /// [page] - The page of items you would like to return (defaults to 1). But can be used for paging a list ect.
  /// [quantity] - The number of items to fetch with each page.
  Future<void> getStores({int page = 1, int quantity = 50}) async {
    final response = await _client.get(Uri.parse(DataType.stores.url + "?page[number]=$page&page[size]=$quantity"));
    List<Store> models = [];
    for (var model in jsonDecode(response.body)['data']) {
      var store = Store.fromJson(model);
      models.add(store);
    }
    _storeStream.sink.add(models);
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
