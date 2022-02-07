import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/book_detail_controller.dart';

class BookDetailView extends GetView<BookDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BookDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
