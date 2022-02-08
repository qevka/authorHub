import 'package:author_hub/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:library_api/library_api.dart';

class BookCard extends StatelessWidget {
  const BookCard({required this.book, required this.author});

  final AuthorComplete author;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation(context: context).pushDetail(author);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.lightBlueAccent.shade400, Colors.lightBlueAccent.shade200])),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
          child: Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text("Published: " + book.datePublished),
                Text("ISBN: " + book.isbn.toString()),
                Text("Author: " + author.author.name!)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
