import 'package:library_api/library_api.dart';
import 'package:rxdart/rxdart.dart';

class LibraryProvider {
  void init() async {
    _bookStream.add(await ApiClient.getBooks());
    _bookAndAuthorStream.add(await ApiClient.getAuthors());
    _storeStream.add(await ApiClient.getStores());
  }

  static final LibraryProvider instance = LibraryProvider._warmUp();

  LibraryProvider._warmUp() {
    _bookStream = BehaviorSubject();
    _storeStream = BehaviorSubject();
    _bookAndAuthorStream = BehaviorSubject();
  }

  factory LibraryProvider() {
    if (!_initialized) {
      instance.init();
      _initialized = true;
    }
    return instance;
  }

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

  static bool _initialized = false;

  void dispose() {
    _bookStream.close();
    _bookAndAuthorStream.close();
    _storeStream.close();
  }
}
