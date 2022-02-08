import 'package:author_hub/views/widgets/author_box.dart';
import 'package:author_hub/views/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:library_api/library_api.dart';
import 'package:library_repository/library_provider.dart';
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
        StreamBuilder<List<AuthorComplete>>(
            stream: Provider.of<LibraryProvider>(context).bookAndAuthorStream,
            builder: (context, snapshot) {
              return CustomScrollView(
                slivers: (snapshot.data == null)
                    ? [
                        SliverToBoxAdapter(
                            child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                              child: SafeArea(
                                  child: Container(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(),
                            alignment: Alignment.bottomCenter,
                          ))),
                        ))
                      ]
                    : <Widget>[
                        const SliverAppBar(
                          floating: true,
                          flexibleSpace: FlexibleSpaceBar(
                            title: Text('AuthorHub'),
                          ),
                        ),
                        Title(
                          title: "Authors",
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            height: 140,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              itemCount: snapshot.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                Author? author = snapshot.data?[index].author;
                                return (author != null)
                                    ? AuthorBox(author: author)
                                    : Container(
                                        height: 20,
                                      );
                              },
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                        Title(
                          title: "Books",
                        ),
                        SliverFixedExtentList(
                          itemExtent: 100.0,
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              List books =
                                  snapshot.data!.where((auth) => (auth.books != null && auth.books.isNotEmpty)).toList();
                              return BookCard(book: books[index].books.first);
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
