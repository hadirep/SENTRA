import 'package:flutter/material.dart';
import 'package:sentra/pages/home_page.dart';
import 'package:sentra/pages/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        SearchPage.routeName: (context) => const SearchPage(),
      },
    );
  }
}