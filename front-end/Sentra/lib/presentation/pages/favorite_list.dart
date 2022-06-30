import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/common.dart';
import 'package:sentra/common/result_state.dart';
import 'package:sentra/presentation/provider/database_provider.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';
import 'package:sentra/presentation/widgets/widget_favorite.dart';

class FavoriteList extends StatefulWidget{
  static const String routeName = '/favorite-list-page';
  const FavoriteList({Key? key}) : super(key: key);

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.favoriteList,
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
      body: Consumer<DatabaseProvider>(
          builder: (context, provider, child) {
            if (provider.state == ResultState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (provider.state == ResultState.hasData) {
              return ListView.builder(
                itemCount: provider.favorites.length,
                itemBuilder: (context, index){
                  return WidgetFavorite(
                    artList: provider.favorites[index],
                  );
                },
              );
            } else if(provider.state == ResultState.noData){
              return Center(
                child: Text(provider.message),
              );
            } else if (provider.state == ResultState.error) {
              return Center(child: Text(provider.message));
            } else {
              return Center(
                child: Text(provider.message),
              );
            }
          }
      ),
    );
  }
}