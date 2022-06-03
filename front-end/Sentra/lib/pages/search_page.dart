import 'package:flutter/material.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/models/art_list.dart';
import 'package:sentra/pages/favorite_list.dart';
import 'package:sentra/pages/home_page.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search_page';
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ArtList> list = dataArtList;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xffead5a0),
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
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
              leading: const Icon(Icons.home_rounded, color: Colors.orange),
              title: const Text('Home',
                style: TextStyle(
                  color: Color(0xff2d4b94), fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, HomePage.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.stars, color: Colors.yellow),
              title: const Text(
                'Favorite List',
                style: TextStyle(
                  color: Color(0xff2d4b94), fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, FavoriteList.routeName);
              },
            ),
            ListTile(
              onTap: () {
                //Navigator.pushNamed(context);
              },
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text(
                'About Us',
                style: TextStyle(
                  color: Color(0xff2d4b94), fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                //Navigator.pushNamed(context);
              },
              leading: const Icon(Icons.settings, color: Colors.grey),
              title: const Text(
                'Settings',
                style: TextStyle(
                  color: Color(0xff2d4b94), fontWeight: FontWeight.bold,
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
            'Search',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Card(
              color: const Color.fromRGBO(252, 241, 215, 1),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: controller,
                      onChanged: searchArt,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(10),
                        prefixIcon: const Icon(
                          Icons.search, color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.orange),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                        ),
                        hintText: "search here...",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 530,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return _listItem(index);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void searchArt(String query) {
    final suggestions = dataArtList.where((artListPage) {
      final artList = artListPage.name.toLowerCase();
      final input = query.toLowerCase();

      return artList.contains(input);
    }).toList();
    setState(() => list = suggestions);
  }

  _listItem(index) {
    final artList = list[index];
    return ListTile(
      onTap: () {
        /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArtListPage(art: artList),
          ),
        );*/
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          artList.image, width: 100, height: 100, fit: BoxFit.cover,
        ),
      ),
      title: Text(
        artList.name,
        style: const TextStyle(
          color: textPrimaryColor, fontSize: 15, fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        children: [
          const SizedBox(height: 4),
          Row(
            children: [
              const SizedBox(width: 5),
              Text(artList.provience,
                style: const TextStyle(
                  color: textPrimaryColor, fontSize: 12, fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: const [
              Icon(
                Icons.stars,
                size: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
