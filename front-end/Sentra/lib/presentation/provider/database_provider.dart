import 'package:flutter/foundation.dart';
import 'package:common/result_state.dart';
import 'package:sentra/data/db/database_helper.dart';
import 'package:sentra/data/models/art_and_province_model.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}) {
    getFavorite();
  }

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<ArtList> _favorites = [];
  List<ArtList> get favorites => _favorites;

  void getFavorite() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      _favorites = await databaseHelper.getFavorite();
      if (_favorites.isNotEmpty) {
        _state = ResultState.hasData;
      } else {
        _state = ResultState.noData;
        _message = 'Kamu belum punya favorite';
      }
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  void addFavorite(ArtList artList) async {
    try {
      await databaseHelper.insertFavorite(artList);
      getFavorite();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorited(String id) async {
    final favoriteArt = await databaseHelper.getFavoriteById(id);
    return favoriteArt.isNotEmpty;
  }

  void removeFavorite(String id) async {
    try {
      await databaseHelper.removeFavorite(id);
      getFavorite();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error : $e';
      notifyListeners();
    }
  }
}
