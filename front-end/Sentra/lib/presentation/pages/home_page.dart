import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/l10n/common_l10n.dart';
import 'package:common/result_state.dart';
import 'package:common/style.dart';
import 'package:sentra/presentation/pages/about_page.dart';
import 'package:sentra/presentation/pages/art_list_more_page.dart';
import 'package:sentra/presentation/pages/favorite_list.dart';
import 'package:sentra/presentation/pages/search_art_page.dart';
import 'package:sentra/presentation/pages/update_more_page.dart';
import 'package:sentra/presentation/pages/user_setting_page.dart';
import 'package:sentra/presentation/provider/art_list_provider.dart';
import 'package:sentra/presentation/provider/update_list_provider.dart';
import 'package:sentra/presentation/pages/art_list_page.dart';
import 'package:sentra/presentation/pages/province_list_page.dart';
import 'package:sentra/presentation/pages/province_more_page.dart';
import 'package:sentra/presentation/provider/province_list_provider.dart';
import 'package:sentra/presentation/widgets/button/more_action.dart';
import 'package:sentra/presentation/pages/update_list_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(234, 213, 160, 1),
        child: Column(
          children: [
            DrawerHeader(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/logo/sentra_drawer.png",
                  width: 10,
                  height: 10,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_rounded, color: Color(0xffdc7e00)),
              title: Text(
                AppLocalizations.of(context)!.home,
                style: const TextStyle(
                  color: textPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context, HomePage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.stars, color: Color(0xffF0BE41)),
              title: Text(
                AppLocalizations.of(context)!.favoriteList,
                style: const TextStyle(
                  color: textPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, FavoriteList.routeName);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.routeName);
              },
              leading: const Icon(Icons.info, color: Color(0xff2d4b94)),
              title: Text(
                AppLocalizations.of(context)!.aboutUS,
                style: const TextStyle(
                  color: textPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, UserSetting.routeName);
              },
              leading: const Icon(Icons.settings, color: Color(0xff969696)),
              title: Text(
                AppLocalizations.of(context)!.settings,
                style: const TextStyle(
                  color: textPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.home,
          style: const TextStyle(
            color: textPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(),
          child: Builder(
            builder: (context) => IconButton(
              icon: Image.asset(
                "assets/logo/sentra.png",
                height: 30,
                width: 30,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/seni/1_bali_tari_kecak.jpg",
                  width: 390,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                AppLocalizations.of(context)!.homeText1,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textPrimaryColor,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.homeText2,
                style: const TextStyle(
                  fontSize: 15,
                  color: textPrimaryColor,
                ),
              ),
              const SizedBox(height: 15),
              moreAction(
                title: AppLocalizations.of(context)!.artProvince,
                onTap: () => Navigator.pushNamed(
                  context,
                  ProvinceMorePage.routeName,
                ),
              ),
              Consumer<ProvinceListProvider>(
                builder: (context, state, _) {
                  if (state.listState == ResultState.loading) {
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.red));
                  } else if (state.listState == ResultState.hasData) {
                    return SizedBox(
                      height: 190,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.list.data.length,
                        itemBuilder: (context, index) {
                          var listData = state.list.data[index];
                          return ProvinceListPage(
                            provinceList: listData,
                          );
                        },
                      ),
                    );
                  } else if (state.listState == ResultState.noData) {
                    return Center(child: Text(state.message));
                  } else if (state.listState == ResultState.error) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text(''));
                  }
                },
              ),
              const SizedBox(height: 15),
              moreAction(
                title: AppLocalizations.of(context)!.artRecommendation,
                onTap: () => Navigator.pushNamed(
                  context,
                  UpdateMorePage.routeName,
                ),
              ),
              Consumer<UpdateListProvider>(
                builder: (context, state, _) {
                  if (state.listState == ResultState.loading) {
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.red));
                  } else if (state.listState == ResultState.hasData) {
                    return SizedBox(
                      height: 190,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.list.data.length,
                        itemBuilder: (context, index) {
                          var listData = state.list.data[index];
                          return UpdateListPage(
                            updateList: listData,
                          );
                        },
                      ),
                    );
                  } else if (state.listState == ResultState.noData) {
                    return Center(child: Text(state.message));
                  } else if (state.listState == ResultState.error) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text(''));
                  }
                },
              ),
              const SizedBox(height: 15),
              moreAction(
                title: AppLocalizations.of(context)!.allArt,
                onTap: () => Navigator.pushNamed(
                  context,
                  ArtListMorePage.routeName,
                ),
              ),
              Consumer<ArtListProvider>(
                builder: (context, state, _) {
                  if (state.listState == ResultState.loading) {
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.red));
                  } else if (state.listState == ResultState.hasData) {
                    return SizedBox(
                      height: 190,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.list.data.length,
                        itemBuilder: (context, index) {
                          var listData = state.list.data[index];
                          return ArtListPage(
                            artList: listData,
                          );
                        },
                      ),
                    );
                  } else if (state.listState == ResultState.noData) {
                    return Center(child: Text(state.message));
                  } else if (state.listState == ResultState.error) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text(''));
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchPage(),
            ),
          );
        },
        backgroundColor: textPrimaryColor,
        child: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}
