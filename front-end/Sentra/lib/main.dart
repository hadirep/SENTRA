import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sentra/common/navigation.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/data/models/art_and_province_model.dart';
import 'package:sentra/data/preferences/preference_helper.dart';
import 'package:sentra/presentation/pages/about_page.dart';
import 'package:sentra/presentation/pages/admin/business_management.dart';
import 'package:sentra/presentation/pages/art_list_more_page.dart';
import 'package:sentra/presentation/pages/admin/create_art.dart';
import 'package:sentra/presentation/pages/details_seller_product.dart';
import 'package:sentra/presentation/pages/favorite_list.dart';
import 'package:sentra/presentation/pages/home_page.dart';
import 'package:sentra/presentation/pages/login_page.dart';
import 'package:sentra/presentation/pages/admin/edit_art.dart';
import 'package:sentra/presentation/pages/search_art_page.dart';
import 'package:sentra/presentation/pages/update_more_page.dart';
import 'package:sentra/presentation/pages/user_setting_page.dart';
import 'package:sentra/presentation/pages/register_page.dart';
import 'package:sentra/presentation/pages/province_more_page.dart';
import 'package:sentra/presentation/pages/province_query_page.dart';
import 'package:provider/provider.dart';
import 'package:sentra/presentation/provider/add_art_provider.dart';
import 'package:sentra/presentation/provider/database_provider.dart';
import 'package:sentra/presentation/provider/preference_provider.dart';
import 'package:sentra/presentation/provider/province_list_provider.dart';
import 'package:sentra/presentation/provider/province_query_provider.dart';
import 'package:sentra/presentation/provider/art_list_provider.dart';
import 'package:sentra/presentation/provider/search_art_provider.dart';
import 'package:sentra/presentation/provider/update_list_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/db/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ChangeNotifierProvider<ProvinceQueryProvider>(
          create: (_) => ProvinceQueryProvider(queryApiService: ApiService(), query: ''),
        ),
        ChangeNotifierProvider<AddArtProvider>(
          create: (_) => AddArtProvider(),
        ),
        ChangeNotifierProvider<UpdateListProvider>(
          create: (_) => UpdateListProvider(listApiService: ApiService()),
        ),
        ChangeNotifierProvider<ArtListProvider>(
          create: (_) => ArtListProvider(listApiService: ApiService()),
        ),
        ChangeNotifierProvider<SearchArtProvider>(
          create: (_) => SearchArtProvider(searchApiService: ApiService()),
        ),
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferenceProvider(preferencesHelper: PreferencesHelper(
            shared: SharedPreferences.getInstance(),
          )),
        ),
      ],
      child: Consumer<PreferenceProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "SENTRA",
            theme: provider.themeData,
            navigatorKey: navigatorKey,
            initialRoute: HomePage.routeName,
            routes: {
              ProvinceQueryPage.routeName: (context) => ProvinceQueryPage(
                queryList: ModalRoute.of(context)?.settings.arguments as ArtList,
              ),
              LoginPage.routeName: (context) => const LoginPage(),
              RegisterPage.routeName: (context) => const RegisterPage(),
              SearchPage.routeName: (context) => const SearchPage(),
              BusinessManagement.routeName: (context) => const BusinessManagement(),
              HomePage.routeName: (context) => const HomePage(),
              FavoriteList.routeName: (context) => const FavoriteList(),
              EditArt.routeName: (context) => const EditArt(),
              ProvinceMorePage.routeName: (context) => const ProvinceMorePage(),
              AboutPage.routeName: (context) => const AboutPage(),
              UserSetting.routeName: (context) => const UserSetting(),
              // PopUpPage.routeName: (context) => const PopUpPage(),
              DetailSellerProduct.routeName: (context) => DetailSellerProduct(
                  artList: ModalRoute.of(context)?.settings.arguments as ArtList),
              CreateArt.routeName: (context) => const CreateArt(),
              ArtListMorePage.routeName: (context) => const ArtListMorePage(),
              UpdateMorePage.routeName: (context) => const UpdateMorePage(),
            },
          );
        },
      ),
    );
  }
}