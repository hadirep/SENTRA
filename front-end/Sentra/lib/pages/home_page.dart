import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/pages/about_page.dart';
import 'package:sentra/pages/all_arts_list.dart';
import 'package:sentra/pages/favorite_list.dart';
import 'package:sentra/pages/new_update_list.dart';
import 'package:sentra/pages/user_setting_page.dart';
import 'package:sentra/presentation/bloc/arts/arts_bloc.dart';
import 'package:sentra/presentation/bloc/arts/arts_event.dart';
import 'package:sentra/presentation/bloc/arts/arts_state.dart';
import 'package:sentra/presentation/bloc/update/update_bloc.dart';
import 'package:sentra/presentation/bloc/update/update_event.dart';
import 'package:sentra/presentation/bloc/update/update_state.dart';
import 'package:sentra/presentation/pages/arts_list_page.dart';
import 'package:sentra/presentation/pages/province_list_page.dart';
import 'package:sentra/presentation/pages/province_more_page.dart';
import 'package:sentra/presentation/pages/search_page.dart';
import 'package:sentra/presentation/pages/update_list_page.dart';
import 'package:sentra/presentation/widgets/more_action.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<UpdateBloc>().add(OnUpdateChanged());
    context.read<ArtsBloc>().add(OnArtsChanged());
  }

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
              SizedBox(
                height: 190,
                child: ProvinceListPage(),
              ),
              const SizedBox(height: 15),
              moreAction(
                title: 'New Update',
                onTap: () => Navigator.pushNamed(context, NewUpdateList.routeName),
              ),
              BlocBuilder<UpdateBloc, UpdateState>(
                builder: (context, state) {
                  if(state is UpdateLoading){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if(state is UpdateHasData){
                    final result = state.result;
                    return UpdateListPage(result);
                  } else if (state is UpdateError) {
                    final result = state.message;
                    return Text(result);
                  } else if (state is UpdateEmpty) {
                    return const Text('New Update Not Found');
                  } else {
                    return const Text('Failed');
                  }
                },
              ),
              const SizedBox(height: 15),
              moreAction(
                title: 'All Arts',
                onTap: () => Navigator.pushNamed(context, AllArtsList.routeName),
              ),
              BlocBuilder<ArtsBloc, ArtsState>(
                builder: (context, state) {
                  if(state is ArtsLoading){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if(state is ArtsHasData){
                    final result = state.result;
                    return ArtsListPage(result);
                  } else if (state is ArtsError) {
                    final result = state.message;
                    return Text(result);
                  } else if (state is ArtsEmpty) {
                    return const Text('All Arts Not Found');
                  } else {
                    return const Text('Failed');
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => const SearchArtPage(),
            ),
          );
        },
        backgroundColor: textPrimaryColor,
        child: const Icon(
          Icons.search, color: Color(0xfff0be41),
        ),
      ),
    );
  }
}
