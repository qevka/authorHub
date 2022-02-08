import 'package:library_api/library_api.dart';
import 'package:rxdart/rxdart.dart';

class LibraryProvider {
  Future<void> init() async {
    _bookStream.add(await ApiClient.getBooks());
    _bookAndAuthorStream.add(await ApiClient.getAuthors());
    _storeStream.add(await ApiClient.getStores());
    _photoStream.add(await ApiClient.getPhotos());
  }

  static final LibraryProvider instance = LibraryProvider._warmUp();

  LibraryProvider._warmUp() {
    _bookStream = BehaviorSubject();
    _storeStream = BehaviorSubject();
    _bookAndAuthorStream = BehaviorSubject();
    _photoStream = BehaviorSubject();
  }

  factory LibraryProvider() {
    if (!_initialized) {
      instance.init();
      _initialized = true;
    }
    return instance;
  }

  /// [selectedStore] the store user is currently selecting defaults to null when null the view returns to normal.
  Store? selectedStore;

  /// [bookStream] a stream of book data.
  Stream<List<Book>> get bookStream => _bookStream.stream;

  /// [authorStream] a stream of authorData
  Stream<List<AuthorComplete>> get bookAndAuthorStream => _bookAndAuthorStream.stream;

  /// [storeStream] a stream of stores
  Stream<List<Store>> get storeStream => _storeStream.stream;

  /// [photoStream] a stream of photos
  Stream<List<Photo>> get photoStream => _photoStream.stream;

  /// Private stream controllers.
  late BehaviorSubject<List<Photo>> _photoStream;
  late BehaviorSubject<List<Book>> _bookStream;
  late BehaviorSubject<List<AuthorComplete>> _bookAndAuthorStream;
  late BehaviorSubject<List<Store>> _storeStream;

  static bool _initialized = false;

  void dispose() {
    _bookStream.close();
    _bookAndAuthorStream.close();
    _storeStream.close();
    _photoStream.close();
  }

  sortStreams({required Store byStore}) async {
    if (selectedStore?.id == byStore.id) {
      selectedStore = null;
      await init();
    } else {
      await init();
      selectedStore = byStore;
      List<AuthorComplete> authorComplete = await bookAndAuthorStream.first;
      List<Book> sortedBook = [];
      List<AuthorComplete> sortedAuthor = [];
      for (var book in byStore.getPointer(ofType: DataType.books)!) {
        for (var author in authorComplete) {
          var result = author.books.where((authbook) => authbook.id == book.id).toList();
          sortedBook.addAll(result);
          if (result.isNotEmpty) sortedAuthor.add(author);
        }
      }
      _bookAndAuthorStream.sink.add(sortedAuthor);
      _bookStream.sink.add(sortedBook);
    }
  }
}
