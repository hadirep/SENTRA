import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentra/models/art_list.dart';
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
import 'package:sentra/presentation/bloc/search_bloc.dart';
import 'package:sentra/presentation/pages/search_page.dart';
import 'package:sentra/injection.dart' as di;
import 'package:provider/provider.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<SearchBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "SENTRA",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SearchArtPage.routeName,
        routes: {
          SearchArtPage.routeName: (context) => const SearchArtPage(),
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
        },
      ),
    );
  }
}