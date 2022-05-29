import 'package:flutter/material.dart';
import 'package:sentra/models/art_list.dart';

import '../models/art_detail.dart';

class ArtListPage extends StatefulWidget {
  final ArtList art;
  static const routeName = '/art_list_page';
  const ArtListPage({Key? key, required this.art}) : super(key: key);

  @override
  State<ArtListPage> createState() => _ArtListPageState();
}

class _ArtListPageState extends State<ArtListPage> {
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
                Navigator.pushNamed(context, "/");
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
                //Navigator.pushNamed(context);
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
            'Art List',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                  /*Container(
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
                  ),*/
                  SizedBox(
                    height: 530,
                    child: SingleChildScrollView(
                      child: GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.4),
                        ),
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Card(
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      widget.art.image, height: 200, fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      widget.art.name, textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff2d4b94),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*void searchArt(String query) {
    final suggestions = dataArtList.where((artListPage) {
      final artList = artListPage.name.toLowerCase();
      final input = query.toLowerCase();

      return artList.contains(input);
    }).toList();
    setState(() => ART = suggestions);
  }*/
}
