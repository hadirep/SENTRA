import 'package:flutter/material.dart';
import 'package:sentra/common/navigation.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/data/models/province_list_model.dart';
import 'package:sentra/data/models/province_query_model.dart';
import 'package:sentra/presentation/pages/about_page.dart';
import 'package:sentra/presentation/pages/admin/business_management.dart';
import 'package:sentra/presentation/pages/favorite_list.dart';
import 'package:sentra/presentation/pages/home_page.dart';
import 'package:sentra/presentation/pages/login_page.dart';
import 'package:sentra/presentation/pages/product_management.dart';
import 'package:sentra/presentation/pages/user_setting_page.dart';
import 'package:sentra/presentation/pages/register_page.dart';
import 'package:sentra/presentation/pages/province_detail_page.dart';
import 'package:sentra/presentation/pages/province_more_page.dart';
import 'package:sentra/presentation/pages/province_query_page.dart';
import 'package:provider/provider.dart';
import 'package:sentra/presentation/provider/province_detail_provider.dart';
import 'package:sentra/presentation/provider/province_list_provider.dart';
import 'package:sentra/presentation/provider/province_query_provider.dart';
import 'package:sentra/presentation/provider/art_list_provider.dart';
import 'package:sentra/presentation/provider/update_list_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProvinceListProvider>(
          create: (_) => ProvinceListProvider(listApiService: ApiService()),
        ),
        ChangeNotifierProvider<ProvinceDetailProvider>(
          create: (_) => ProvinceDetailProvider(detailApiService: ApiService(), id: ''),
        ),
        ChangeNotifierProvider<ProvinceQueryProvider>(
          create: (_) => ProvinceQueryProvider(queryApiService: ApiService(), query: ''),
        ),
        ChangeNotifierProvider<UpdateListProvider>(
          create: (_) => UpdateListProvider(listApiService: ApiService()),
        ),
        ChangeNotifierProvider<ArtListProvider>(
          create: (_) => ArtListProvider(listApiService: ApiService()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "SENTRA",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorKey: navigatorKey,
        initialRoute: HomePage.routeName,
        routes: {
          ProvinceDetailPage.routeName: (context) => ProvinceDetailPage(
            provinceQuery: ModalRoute.of(context)?.settings.arguments as ProvinceQuery,
          ),
          ProvinceQueryPage.routeName: (context) => ProvinceQueryPage(
            queryList: ModalRoute.of(context)?.settings.arguments as ProvinceList,
          ),
          LoginPage.routeName: (context) => const LoginPage(),
          RegisterPage.routeName: (context) => const RegisterPage(),
          BusinessManagement.routeName: (context) => const BusinessManagement(),
          HomePage.routeName: (context) => const HomePage(),
          FavoriteList.routeName: (context) => const FavoriteList(),
          ProductManagement.routeName: (context) => const ProductManagement(),
          ProvinceMorePage.routeName: (context) => const ProvinceMorePage(),
          AboutPage.routeName: (context) => const AboutPage(),
          UserSetting.routeName: (context) => UserSetting(),
        },
      ),
    );
  }
}