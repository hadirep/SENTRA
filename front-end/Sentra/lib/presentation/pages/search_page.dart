import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/pages/home_page.dart';
import 'package:sentra/presentation/bloc/search/search_bloc.dart';
import 'package:sentra/presentation/widgets/art_card_list.dart';

class SearchArtPage extends StatelessWidget {
  static const routeName = '/search-art-page';

  const SearchArtPage({Key? key}) : super(key: key);

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
      body: Padding(
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
                    onChanged: (query) {
                      context.read<SearchBloc>().add(OnQueryChanged(query));
                    },
                    textInputAction: TextInputAction.search,
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
                const Text(
                  'Search Result',
                  style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                _blocArt(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _blocArt() {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is SearchLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is SearchHasData) {
        final result = state.result;
        return Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final art = result[index];
                return ArtCard(art);
              },
              itemCount: result.length,
            ));
      } else if (state is SearchError) {
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
    });
  }
}

