import 'attributes/author.dart';
import 'attributes/book.dart';

class BookAndAuthor {
  BookAndAuthor({required this.books, required this.author});

  List<Book> books = [];
  final Author author;
}
