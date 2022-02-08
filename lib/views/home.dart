import 'package:author_hub/views/widgets/author_box.dart';
import 'package:author_hub/views/widgets/book_card.dart';
import 'package:author_hub/views/widgets/sliver_title.dart';
import 'package:author_hub/views/widgets/store_box.dart';
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
  Future<void> _refreshStreams() => Future.delayed(Duration(seconds: 2), () {
        setState(() {
          LibraryProvider.instance.init();
          print("refreshedStreams");
        });
      });

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    LibraryProvider.instance.dispose();
  }

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
              late List authorCompete;
              if (snapshot.data != null) {
                authorCompete = snapshot.data!.where((auth) => (auth.books.isNotEmpty)).toList();
              }
              return RefreshIndicator(
                displacement: 200,
                onRefresh: _refreshStreams,
                child: CustomScrollView(
                  slivers: (snapshot.data == null)
                      ? <Widget>[
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
                          SliverAppBar(
                            leading: IconButton(icon: Icon(Icons.store), onPressed: () {}),
                            floating: true,
                            flexibleSpace: FlexibleSpaceBar(
                              title: Text('AuthorHub'),
                            ),
                          ),
                          SliverTitle(title: "Stores", pinned: false, color: Colors.grey),
                          SliverToBoxAdapter(
                            child: Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width,
                              child: StreamBuilder<List<Store>>(
                                  stream: LibraryProvider.instance.storeStream,
                                  builder: (context, snapshot) {
                                    var haveData = (snapshot.data != null);
                                    return !haveData
                                        ? Container()
                                        : ListView.builder(
                                            itemCount: snapshot.data!.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return (snapshot.data != null)
                                                  ? StoreBox(store: snapshot.data![index])
                                                  : Container(
                                                      height: 20,
                                                    );
                                            });
                                  }),
                            ),
                          ),
                          SliverTitle(title: "Authors", pinned: false, color: Colors.grey),
                          SliverToBoxAdapter(
                            child: Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data?.length ?? 0,
                                itemBuilder: (context, index) {
                                  AuthorComplete? author = snapshot.data?[index];
                                  return (author != null)
                                      ? AuthorBox(author: author)
                                      : Container(
                                          height: 20,
                                        );
                                },
                              ),
                            ),
                          ),
                          SliverTitle(
                            title: "Books",
                            color: Colors.lightBlue.shade200,
                          ),
                          SliverFixedExtentList(
                            itemExtent: 100.0,
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return BookCard(
                                  book: authorCompete[index].books.first,
                                  author: authorCompete[index],
                                );
                              },
                              childCount: authorCompete.length,
                            ),
                          )
                        ],
                ),
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
