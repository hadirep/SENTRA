import 'package:flutter/material.dart';
import 'package:sentra/pages/admin/business_management.dart';
import 'package:sentra/pages/home_page.dart';
import 'package:sentra/pages/login_page.dart';
import 'package:sentra/pages/register_page.dart';
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
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        BusinessManagement.routeName: (context) => const BusinessManagement(),
        HomePage.routeName: (context) => const HomePage(),
        SearchPage.routeName: (context) => const SearchPage(),
      },
    );
  }
}