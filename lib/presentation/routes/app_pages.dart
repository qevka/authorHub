import 'package:author_hub/presentation/modules/splash/bindings/splash_binding.dart';
import 'package:author_hub/presentation/modules/splash/views/splash_view.dart';
import 'package:get/get.dart';

import '../modules/book_detail/bindings/book_detail_binding.dart';
import '../modules/book_detail/views/book_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.bookDetail,
      page: () => BookDetailView(),
      binding: BookDetailBinding(),
    ),
    GetPage(
      name: _Paths.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
