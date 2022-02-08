import 'models.dart';

class AuthorComplete {
  AuthorComplete({required this.books, required this.author});

  List<Book> books = [];
  final Author author;
  List<Photo> photos = [];
}
