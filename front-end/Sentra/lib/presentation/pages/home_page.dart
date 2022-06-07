import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/result_state.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/presentation/pages/about_page.dart';
import 'package:sentra/presentation/pages/favorite_list.dart';
import 'package:sentra/presentation/pages/user_setting_page.dart';
import 'package:sentra/presentation/provider/art_list_provider.dart';
import 'package:sentra/presentation/provider/update_list_provider.dart';
import 'package:sentra/presentation/widgets/widget_art_list.dart';
import 'package:sentra/presentation/widgets/widget_province_list.dart';
import 'package:sentra/presentation/pages/province_more_page.dart';
import 'package:sentra/presentation/provider/province_list_provider.dart';
import 'package:sentra/presentation/widgets/more_action.dart';
import 'package:sentra/presentation/widgets/widget_update_list.dart';

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
                  "assets/logo/sentra_drawer.png", width: 10, height: 10,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_rounded, color: Color(0xffdc7e00)),
              title: const Text(
                "Home",
                style: TextStyle(
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
              title: const Text(
                'Favorite List',
                style: TextStyle(
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
              title: const Text(
                'About Us',
                style: TextStyle(
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
              title: const Text(
                'Settings',
                style: TextStyle(
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
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Home',
            style: TextStyle(color: textPrimaryColor, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        leading : Padding(
          padding: const EdgeInsets.symmetric(),
          child: Builder(
            builder: (context) => IconButton(
              icon: Image.asset(
                "assets/logo/sentra.png", height: 40, width: 40,
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
                  "assets/seni/1_bali_tari_kecak.jpg", width: 390, height: 150, fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Welcome,",
                style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: textPrimaryColor,
                ),
              ),
              const Text(
                "what kind of art do you want to see?",
                style: TextStyle(
                  fontSize: 15, color: textPrimaryColor,
                ),
              ),
              const SizedBox(height: 15),
              moreAction(
                title: 'Filter By Province',
                onTap: () => Navigator.pushNamed(context, ProvinceMorePage.routeName),
              ),
              Consumer<ProvinceListProvider>(
                builder: (context, state, _) {
                  if (state.listState == ResultState.loading) {
                    return const Center(child: CircularProgressIndicator(color: Colors.red));
                  } else if (state.listState == ResultState.hasData) {
                    return SizedBox(
                      height: 190,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.list.data.length,
                        itemBuilder: (context, index) {
                          var listData = state.list.data[index];
                          return WidgetProvinceList(
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
              /* moreAction(
                title: 'New Update',
                onTap: () => Navigator.pushNamed(context, NewUpdateList.routeName),
              ),*/
              Consumer<UpdateListProvider>(
                builder: (context, state, _) {
                  if (state.listState == ResultState.loading) {
                    return const Center(child: CircularProgressIndicator(color: Colors.red));
                  } else if (state.listState == ResultState.hasData) {
                    return SizedBox(
                      height: 190,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.list.data.length,
                        itemBuilder: (context, index) {
                          var listData = state.list.data[index];
                          return WidgetUpdateList(
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
              /*moreAction(
                title: 'All Arts',
                onTap: () => Navigator.pushNamed(context, AllArtsList.routeName),
              ),*/
              Consumer<ArtListProvider>(
                builder: (context, state, _) {
                  if (state.listState == ResultState.loading) {
                    return const Center(child: CircularProgressIndicator(color: Colors.red));
                  } else if (state.listState == ResultState.hasData) {
                    return SizedBox(
                      height: 190,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.list.data.length,
                        itemBuilder: (context, index) {
                          var listData = state.list.data[index];
                          return WidgetArtList(
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
          /*Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => const SearchArtPage(),
            ),
          );*/
        },
        backgroundColor: textPrimaryColor,
        child: const Icon(
          Icons.search, color: Color(0xfff0be41),
        ),
      ),
    );
  }
}