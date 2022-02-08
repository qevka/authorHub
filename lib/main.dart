import 'package:author_hub/views/home.dart';
import 'package:author_hub/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:library_repository/library_provider.dart';
import 'package:provider/provider.dart';

import 'navigation/navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AuthorHub',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      color: Colors.blue,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.home:
            return createRoute(context, Home());
          case Routes.detail:
            return createRoute(context, Splash());
        }
        return null;
      },
      builder: (_, navigator) {
        return MultiProvider(providers: [
          Provider<LibraryProvider>(create: (context) => LibraryProvider()),
        ], child: navigator);
      },
    );
  }
}

MaterialPageRoute<T> createRoute<T>(BuildContext context, Widget child) {
  return MaterialPageRoute(
    builder: (context) => Provider<Navigation>(
      create: (context) => Navigation(context: context),
      child: child,
    ),
  );
}
