import 'dart:async';
import 'package:sentra/data/models/art_table.dart';
import 'package:sentra/domain/usecases/get_favorite_arts.dart';
import 'package:sentra/domain/usecases/remove_favorite.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initDb();
    }
    return _database;
  }
  
  static const String _tblFavorite = 'favorite';
    Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/sentra.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate,);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblFavorite (
        id TEXT,
        name TEXT,
        image TEXT,
        province TEXT
      );
    ''');
  }

  Future<int> insertFavorite(ArtTable art) async {
    final db = await database;
    return await db!.insert(_tblFavorite, art.toJson());
  }

  Future<int> RemoveFavoriteArts(ArtTable art) async {
    final db = await database;
    return await db!.delete(
      _tblFavorite,
      where: 'id = ?',
      whereArgs: [art.id],
    );
  }
  
  Future<Map<String, dynamic>?> getArtById(String id) async {
    final db = await database;
    final results = await db!.query(
      _tblFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getFavoriteArts() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblFavorite);

    return results;
  }
}