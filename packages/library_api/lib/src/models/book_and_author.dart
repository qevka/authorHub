import 'author.dart';
import 'book.dart';

class BookAndAuthor {
  BookAndAuthor({required this.books, required this.author});

  List<Book> books = [];
  final Author author;
}
