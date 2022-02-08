import 'package:author_hub/models/attributes/book.dart';
import 'package:author_hub/models/book_and_author.dart';
import 'package:author_hub/providers/library_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        StreamBuilder<List<BookAndAuthor>>(
            stream: Provider.of<ApiProvider>(context).bookAndAuthorStream,
            builder: (context, snapshot) {
              return CustomScrollView(
                slivers: <Widget>[
                  const SliverAppBar(
                    floating: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('AuthorHub'),
                    ),
                  ),
                  Title(
                    title: "BirthPlaces",
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          List<Book>? book = snapshot.data![index].books;
                          return (book.isNotEmpty)
                              ? Container(
                                  alignment: Alignment.centerLeft,
                                  color: Colors.teal[100 * (index % 9)],
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Text(
                                        book.first.title,
                                        style: TextStyle(fontSize: 12, color: Colors.black38),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 20,
                                );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  Title(
                    title: "Authors",
                  ),
                  SliverFixedExtentList(
                    itemExtent: 50.0,
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          color: Colors.lightBlue[100 * (index % 9)],
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                snapshot.data![index].author.name!,
                                style: TextStyle(fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: snapshot.data?.length ?? 0,
                    ),
                  )
                ],
              );
            }),
      ],
    );
  }
}

class Holder extends StatelessWidget {
  Holder({required this.title, this.quantity = 20});
  final String title;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 50.0,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.centerLeft,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                color: Colors.transparent,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          );
        },
        childCount: quantity,
      ),
    );
  }
}

class Title extends StatelessWidget {
  Title({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SliverHeaderDelagate(title: title),
      pinned: true,
    );
  }
}

class _SliverHeaderDelagate extends SliverPersistentHeaderDelegate {
  _SliverHeaderDelagate({required this.title});
  final String title;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.lightBlue,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          color: Colors.transparent,
          child: Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
    // TODO: implement build
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 50;

  @override
  // TODO: implement minExtent
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
