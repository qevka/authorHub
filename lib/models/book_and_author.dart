import 'generic_data_model.dart';

class BookAndAuthor {
  BookAndAuthor({required this.books, required this.author});

  List<Book> books = [];
  final Author author;
}
