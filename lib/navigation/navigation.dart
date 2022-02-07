import 'package:flutter/material.dart';

class Navigation {
  final BuildContext _context;

  Navigation({required BuildContext context}) : _context = context;

  void pushHome() {
    Navigator.of(_context).pushNamed(Routes.home);
  }

  void pushDetail() {
    Navigator.of(_context).pushNamed(Routes.detail);
  }

  void pushSplash() {
    Navigator.of(_context).pushNamed(Routes.splash);
  }
}

class Routes {
  static const String home = '/';
  static const String detail = '/detail';
  static const String splash = '/splash';
}

extension RouteExtension on Routes {
  String get stringVal {
    return toString().split(".").last;
  }
}
