import 'package:author_hub/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:library_api/library_api.dart';

class AuthorBox extends StatelessWidget {
  const AuthorBox({
    Key? key,
    required this.author,
  }) : super(key: key);

  final AuthorComplete author;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigation(context: context).pushDetail(author);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.blueGrey.shade200, Colors.blueGrey.shade700])),
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      child: Image.network("https://picsum.photos/200?random=2"),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      )),
                  Text(
                    author.author.name!,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    "born: " + author.author.birthplace!,
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
