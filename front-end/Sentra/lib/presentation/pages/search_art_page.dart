import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/common.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/presentation/provider/search_art_provider.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';
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
              Text(
                AppLocalizations.of(context)!.searchLoad,
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.search,
          style: const TextStyle(
              color: Color.fromARGB(255, 45, 74, 148),
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        leading: const Align(
          alignment: Alignment.centerLeft,
          child: ButtonBack(),
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
                AppLocalizations.of(context)!.searchText,
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

