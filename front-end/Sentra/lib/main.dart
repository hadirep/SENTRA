import 'package:flutter/material.dart';
import 'package:sentra/models/art_list.dart';
import 'package:sentra/pages/about_page.dart';
import 'package:sentra/pages/admin/business_management.dart';
import 'package:sentra/pages/details_seller_product.dart';
import 'package:sentra/pages/favorite_list.dart';
import 'package:sentra/pages/home_page.dart';
import 'package:sentra/pages/list.dart';
import 'package:sentra/pages/login_page.dart';
import 'package:sentra/pages/product_management.dart';
import 'package:sentra/pages/provience_page.dart';
import 'package:sentra/pages/register_page.dart';
import 'package:sentra/pages/search_page.dart';
import 'package:sentra/pages/user_setting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        BusinessManagement.routeName: (context) => const BusinessManagement(),
        HomePage.routeName: (context) => const HomePage(),
        SearchPage.routeName: (context) => const SearchPage(),
        //list. akan dihapus
        MainScreen.routeName: (context) => const MainScreen(list: '',),
        // 
        DetailSellerProduct.routeName: (context) =>  DetailSellerProduct(place:
                  ModalRoute.of(context)?.settings.arguments as ArtList ),
        FavoriteList.routeName: (context) => const FavoriteList(),
        ProductManagement.routeName: (context) => const ProductManagement(),
        ProviencePage.routeName: (context) => const ProviencePage(),
        AboutPage.routeName: (context) => AboutPage(),
        UserSetting.routeName: (context) => UserSetting(),
      },
    );
  }
}