import 'package:flutter/material.dart';
import 'package:sentra/models/art_provience.dart';
import 'package:sentra/models/art_update.dart';
import 'package:sentra/models/art_list.dart';
import 'package:sentra/pages/about_page.dart';
import 'package:sentra/pages/provience_page.dart';
import 'package:sentra/pages/search_page.dart';
import 'package:sentra/pages/user_setting_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';
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
                  color: Color(0xff2d4b94),
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
                  color: Color(0xff2d4b94),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                //Navigator.pushNamed(context, routes favorite page);
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
                  color: Color(0xff2d4b94),
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
                  color: Color(0xff2d4b94),
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
            style: TextStyle(color: Color(0xff2d4b94), fontWeight: FontWeight.bold),
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
                  fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff2d4b94),
                ),
              ),
              const Text(
                "what kind of art do you want to see?",
                style: TextStyle(
                  fontSize: 15, color: Color(0xff2d4b94),
                ),
              ),
              const SizedBox(height: 15),
              _moreAction(
                title: 'Filter By Province',
                onTap: () => Navigator.pushNamed(context, ProviencePage.routeName),
              ),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _listProvienceItem(index);
                  },
                  itemCount: dataArtProvience.length,
                ),
              ),
              const SizedBox(height: 15),
              _moreAction(
                title: 'New Update',
                onTap: () => Navigator.pushNamed(context, "/searchPage"),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.3),
                ),
                itemCount: dataArtUpdate.length,
                itemBuilder: (context, index) {
                  return _gridNewUpdateItem(index);
                },
              ),
              const SizedBox(height: 15),
              _moreAction(
                title: 'All Arts',
                onTap: () => Navigator.pushNamed(context, "/allArts"),
              ),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _listAllArtsItem(index);
                  },
                  itemCount: dataArtList.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => const SearchPage(),
            ),
          );
        },
        backgroundColor: const Color(0xff2d4b94),
        child: const Icon(
          Icons.search, color: Color(0xfff0be41),
        ),
      ),
    );
  }

  _listProvienceItem(index) {
    final ArtProvience artProvience = dataArtProvience[index];
    return InkWell(
      onTap: () {
        // Menuju detail page filter
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  artProvience.image, width: 150, height: 200, fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  artProvience.provience,
                  style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff2d4b94),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _gridNewUpdateItem(index){
    ArtUpdate artUpdate = dataArtUpdate[index];
    return InkWell(
      onTap: () {
        // Menuju detail page new update
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  artUpdate.image, height: 200, fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  artUpdate.name, textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff2d4b94),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _listAllArtsItem(index) {
    final ArtList artList = dataArtList[index];
    return InkWell(
      onTap: () {
        // Menuju detail page filter
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  artList.image, width: 150, height: 200, fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  artList.provience,
                  style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff2d4b94),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _moreAction({required String title, required Function() onTap}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff2d4b94),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text(
                  'More',
                  style: TextStyle(
                    fontSize: 15, color: Color(0xff2d4b94),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios, size: 15,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
