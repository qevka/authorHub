import 'package:flutter/material.dart';
import 'package:library_api/library_api.dart';

class Detail extends StatefulWidget {
  const Detail({required this.author});

  final AuthorComplete author;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Photo? photo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStuff();
  }

  void getStuff() async {
    var photoList = widget.author.author.getPointer(ofType: DataType.photos);
    late Photo photo1;
    if (photoList != null && photoList.isNotEmpty) {
      photo1 = await ApiClient.getItem<Photo>(typeOf: DataType.photos, id: photoList.first.id);
      setState(() {
        photo = photo1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (photo != null)
                  ? Container(
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(photo!.uri),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    )
                  : Container(),
              Text(
                widget.author.author.name!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "born: " + widget.author.author.birthplace!,
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "dob: " + widget.author.author.dob!,
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "dod: " + widget.author.author.dod!,
                      style: TextStyle(fontSize: 12),
                    ),
                    (widget.author.books.isNotEmpty)
                        ? Text(
                            "Books",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        : Container(),
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Center(child: Container(child: Text(widget.author.books[index].title), height: 30));
                      },
                      itemCount: widget.author.books.length,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
