import 'package:author_hub/presentation/modules/splash/bindings/splash_binding.dart';
import 'package:author_hub/presentation/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      initialBinding: SplashBinding(),
      getPages: AppPages.routes,
    ),
  );
}
