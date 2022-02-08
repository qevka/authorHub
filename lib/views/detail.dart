import 'package:flutter/material.dart';
import 'package:library_api/library_api.dart';

class Detail extends StatelessWidget {
  const Detail({required this.author});

  final Author author;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Details"),
      ),
      body: Column(
        children: [Text(author.name!), Text(author.birthplace!), Text(author.dob!), Text(author.dod!)],
      ),
    );
  }
}
