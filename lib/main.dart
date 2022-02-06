import 'package:author_hub/providers/authors_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'app/routes/app_pages.dart';
import 'models/data_types.dart';

void main() async {
  var authors = await AuthorsProvider(client: http.Client()).getAuthors();
  for (var element in authors) {
    for (var p in element!.relationships) {
      print(p.type?.url);
    }
  }
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
