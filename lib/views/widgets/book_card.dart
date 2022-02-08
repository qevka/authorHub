import 'package:flutter/material.dart';
import 'package:library_api/library_api.dart';

class BookCard extends StatelessWidget {
  const BookCard({required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              Text(
                book.title,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Text(book.datePublished),
            ],
          ),
        ),
      ),
    );
  }
}
