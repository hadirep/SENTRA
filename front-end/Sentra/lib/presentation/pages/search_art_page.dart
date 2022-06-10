import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/presentation/pages/home_page.dart';
import 'package:sentra/presentation/provider/search_art_provider.dart';
import 'package:sentra/presentation/widgets/widget_card_art_search.dart';
import 'package:sentra/presentation/widgets/widget_search.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search';

  const SearchPage({Key? key}) : super(key: key);

  Widget _blocArt() {
  return Consumer<SearchArtProvider>(
    builder: (context, state, _) {
      if (state.artState == ArtState.loading) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LinearProgressIndicator(
                minHeight: 5,
                color: secondaryColor,
              ),
              const SizedBox(height: 10),
              Text('Memuat Data Kesenian...',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        );
      } else if (state.artState == ArtState.hasData) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.searchArt!.data.length,
          itemBuilder: (context, index) {
            var arts = state.searchArt!.data[index];
            return ArtCard(art: arts);
          },
        );
      } else if (state.artState == ArtState.error) {
        return Expanded(
          child: Center(
            child: Text(state.message),
          ),
        );
      } else {
        return Expanded(
          child: Container(),
        );
      }
    },
  );
}

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
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
                'Favorite',
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
                'Tentang Kami',
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
                'Pengaturan',
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
            'Pencarian',
            style: TextStyle(
              color: Color(0xff2d4b94),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.close,
              color: buttonPrimaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
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
      body: OfflineBuilder(
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return Visibility(
            visible: true,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: heightScreen,
                    child: Card(
                      semanticContainer: true,
                      color: const Color.fromRGBO(252, 241, 215, 1),
                      child: Column(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: SearchWidget(),
                          ),
                          Expanded(
                            flex: 5,
                            child: SizedBox(
                              height: heightScreen-200,
                              child:_blocArt(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
          } else {
            return Container(
            color: primaryColor,
            child: Center(
              child: Text(
                "Koneksi Internet Anda Tidak Aktif :(",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
          }
        },
        child: Container(),
      ),
    );
  }
}

