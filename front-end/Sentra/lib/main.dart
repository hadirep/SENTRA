import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentra/models/art_provience.dart';
import 'package:sentra/pages/about_page.dart';
import 'package:sentra/pages/admin/business_management.dart';
import 'package:sentra/pages/details_seller_product.dart';
import 'package:sentra/pages/favorite_list.dart';
import 'package:sentra/pages/home_page.dart';
import 'package:sentra/pages/login_page.dart';
import 'package:sentra/pages/product_management.dart';
import 'package:sentra/pages/user_setting_page.dart';
import 'package:sentra/presentation/bloc/arts/arts_bloc.dart';
import 'package:sentra/presentation/bloc/detail/detail_bloc.dart';
import 'package:sentra/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:sentra/presentation/bloc/update/update_bloc.dart';
import 'package:sentra/pages/register_page.dart';
import 'package:sentra/presentation/bloc/search/search_bloc.dart';
import 'package:sentra/presentation/pages/province_more_page.dart';
import 'package:sentra/presentation/pages/province_page.dart';
import 'package:sentra/presentation/pages/search_page.dart';
import 'package:sentra/injection.dart' as di;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          create: (_) => di.locator<UpdateBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ArtsBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchBloc>(),
        ),
        // BlocProvider(
        //   create: (_) => di.locator<DetailBloc>(),
        // ),
        BlocProvider(
          create: (_) => di.locator<FavoriteBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "SENTRA",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomePage.routeName,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case SearchArtPage.routeName:
              return CupertinoPageRoute(builder: (_) => SearchArtPage());
            case RegisterPage.routeName:
              return CupertinoPageRoute(builder: (_) => RegisterPage());
            case BusinessManagement.routeName:
              return CupertinoPageRoute(builder: (_) => BusinessManagement());
            case HomePage.routeName:
              return CupertinoPageRoute(builder: (_) => HomePage());
            case LoginPage.routeName:
              return CupertinoPageRoute(builder: (_) => LoginPage());
            case FavoriteList.routeName:
              return CupertinoPageRoute(builder: (_) => FavoriteList());
            case ProductManagement.routeName:
              return CupertinoPageRoute(builder: (_) => ProductManagement());
            case ProvinceMorePage.routeName:
              return CupertinoPageRoute(builder: (_) => ProvinceMorePage());
            case ProvincePage.routeName:
              return CupertinoPageRoute(builder: (_) => ProvincePage(artProvince: ModalRoute.of(context)?.settings.arguments as ArtProvince));
            case AboutPage.routeName:
              return CupertinoPageRoute(builder: (_) => AboutPage());
            case UserSetting.routeName:
              return CupertinoPageRoute(builder: (_) => UserSetting());
            // case DetailSellerProduct.routeName:
            //   final id = settings.arguments as String;
            //   return MaterialPageRoute(
            //     builder: (_) => DetailSellerProduct(id: id),
            //     settings: settings,
            //   );
          }
        },
        // routes: {
        //   SearchArtPage.routeName: (context) => const SearchArtPage(),
        //   LoginPage.routeName: (context) => const LoginPage(),
        //   RegisterPage.routeName: (context) => const RegisterPage(),
        //   BusinessManagement.routeName: (context) => const BusinessManagement(),
        //   HomePage.routeName: (context) => const HomePage(),
        //   SearchPage.routeName: (context) => const SearchPage(),
        //   //list. akan dihapus
        //   // MainScreen.routeName: (context) => const MainScreen(list: '',),
        //   // DetailSellerProduct.routeName: (context) =>  DetailSellerProduct(
        //   // id:
        //   // ModalRoute.of(context)?.settings.arguments as ArtList )
        //   // DetailSellerProduct.routeName: (context) =>  DetailSellerProduct(
        //   // id:
        //   // MaterialPageRoute.(builder)?.settings.arguments as ArtList),
        //   // DetailSellerProduct.routeName :(context) => DetailSellerProduct(
        //   // id: 
        //   // ModalRoute.of(context)?.settings.arguments as String),
        //   DetailSellerProduct.routeName:
        //        id = name.arguments as int;
        //       return MaterialPageRoute(
        //         builder: (_) => DetailSellerProduct(id: id),
        //         // settings: settings,
        //       );

        //   FavoriteList.routeName: (context) => const FavoriteList(),
        //   ProductManagement.routeName: (context) => const ProductManagement(),
        //   ProvienceMorePage.routeName: (context) => const ProvienceMorePage(),
        //   AboutPage.routeName: (context) => AboutPage(),
        //   UserSetting.routeName: (context) => UserSetting(),
        // },
      ),
    );
  }
}