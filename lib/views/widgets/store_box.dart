import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_api/library_api.dart';
import 'package:library_repository/library_provider.dart';

class StoreBox extends StatefulWidget {
  const StoreBox({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Store store;

  @override
  State<StoreBox> createState() => _StoreBoxState();
}

class _StoreBoxState extends State<StoreBox> {
  late bool isSelected;

  @override
  Widget build(BuildContext context) {
    bool isSelected = (widget.store.id == LibraryProvider.instance.selectedStore?.id);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
          LibraryProvider.instance.sortStreams(byStore: widget.store);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: isSelected
                      ? [Colors.blueGrey.shade200, Colors.blueGrey.shade700]
                      : [Colors.blueGrey, Colors.blueGrey.shade700])),
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  Text(
                    widget.store.name,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    "Address: " + widget.store.address,
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
