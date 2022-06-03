import 'dart:async';
import 'package:sentra/data/datasources/database/database_helper.dart';
import 'package:sentra/data/models/art_table.dart';
import 'package:sentra/common/exception.dart';

abstract class ArtLocalDataSource {
  Future<String> insertFavorite(ArtTable art);
  Future<String> removeFavoriteArts(ArtTable art);
  Future<ArtTable?> getArtById(String id);
  Future<List<ArtTable>> getFavoriteArts();
}

class ArtLocalDataSourceImpl implements ArtLocalDataSource {
  final DatabaseHelper databaseHelper;

  ArtLocalDataSourceImpl({required this.databaseHelper});

  @override 
  Future<String> insertFavorite(ArtTable art) async {
    try {
      await databaseHelper.insertFavorite(art);
      return 'Added to Favorite Art';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override 
  Future<String> removeFavoriteArts(ArtTable art) async {
    try {
      await databaseHelper.RemoveFavoriteArts(art);
      return 'Removed from favorite art';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<ArtTable?> getArtById(String id) async {
    final result = await databaseHelper.getArtById(id);
    if (result != null) {
      return ArtTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<ArtTable>> getFavoriteArts() async {
    final result = await databaseHelper.getFavoriteArts();
    return result.map((data) => ArtTable.fromMap(data)).toList();
  }
  }