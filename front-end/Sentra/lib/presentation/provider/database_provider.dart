import 'package:flutter/foundation.dart';
import 'package:sentra/common/result_state.dart';
import 'package:sentra/data/db/database_favorite.dart';
import 'package:sentra/data/models/art_list_model.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}) {
    _getFavorite();
  }

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<ArtList> _favorites = [];
  List<ArtList> get favorites => _favorites;

  ///get bookmarks data from database
  void _getFavorite() async {
    _favorites = await databaseHelper.getFavorite();
    if (_favorites.isNotEmpty) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  ///method to add favorite list
  void addFavorite(ArtList artList) async {
    try {
      await databaseHelper.insertFavorite(artList);
      _getFavorite();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  ///method to returning status favorite from artlist
  Future<bool> isFavorited(String id) async {
    final favoritedArt = await databaseHelper.getFavoriteById(id);
    return favoritedArt.isNotEmpty;
  }

  ///method to delete favorite
  void removeFavorite(String id) async {
    try {
      await databaseHelper.removeFavorite(id);
      _getFavorite();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error : $e';
      notifyListeners();
    }
  }
}