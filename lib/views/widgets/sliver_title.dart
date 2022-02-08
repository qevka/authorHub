import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverTitle extends StatelessWidget {
  SliverTitle({required this.title, this.pinned = true, required this.color});
  final String title;
  final bool pinned;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _SliverHeaderDelagate(title: title, color: color),
      pinned: pinned,
    );
  }
}

class _SliverHeaderDelagate extends SliverPersistentHeaderDelegate {
  _SliverHeaderDelagate({required this.title, required this.color});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.centerLeft,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          color: Colors.transparent,
          child: Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
    // TODO: implement build
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 100;

  @override
  // TODO: implement minExtent
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
