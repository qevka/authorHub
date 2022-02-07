import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.loading.value
          ? CircularProgressIndicator(
              color: Colors.white,
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return _buildFixedList(Colors.white, controller.books[index].attributes!.title);
              },
              itemCount: controller.books.length,
            );
    });
  }

  Widget _buildBook() {
    return Container(
      width: 60,
      height: 80,
      color: Colors.blueGrey,
    );
  }

  Widget _buildFixedList(Color color, String _text) {
    return Material(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        width: Get.width,
        alignment: Alignment.centerLeft,
        color: color,
        child: Text(
          _text,
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
    ));
  }
}
