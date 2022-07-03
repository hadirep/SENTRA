import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/l10n/common_l10n.dart';
import 'package:common/result_state.dart';
import 'package:sentra/presentation/provider/art_list_provider.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';
import 'package:sentra/presentation/widgets/widget_art_list_more.dart';

class ArtListMorePage extends StatefulWidget {
  static const routeName = '/art-list-more-page';
  const ArtListMorePage({Key? key}) : super(key: key);
  @override
  State<ArtListMorePage> createState() => _ArtListMorePageState();
}

class _ArtListMorePageState extends State<ArtListMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.allArt,
          style: const TextStyle(
            color: Color.fromARGB(255, 45, 74, 148),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const Align(
          alignment: Alignment.centerLeft,
          child: ButtonBack(),
        ),
      ),
      body: Consumer<ArtListProvider>(
        builder: (context, state, _) {
          if (state.listState == ResultState.loading) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.red));
          } else if (state.listState == ResultState.hasData) {
            return GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: state.list.data.length,
              itemBuilder: (context, index) {
                var listData = state.list.data[index];
                return WidgetArtListMore(
                  artList: listData,
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.9),
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
    );
  }
}
