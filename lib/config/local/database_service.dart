import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:van_dog/features/favorite/infrastructure/local/dto/favorite_breeds_local_dto.dart';

class DatabaseService {
  static Database? _db;
  static const String databaseName = 'database.db';
  static const int databaseVersion = 1;
  static const String favoriteBreedsTable = 'favorite_breeds';

  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databaseFullPath = '$databaseDirPath/$databaseName';

    final database = await openDatabase(
      databaseFullPath,
      version: databaseVersion,
      onCreate: _onCreate,
    );
    return database;
  }

  FutureOr<void> _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $favoriteBreedsTable(
        ${FavoriteBreedsLocalDto.idField} TEXT PRIMARY KEY,
        ${FavoriteBreedsLocalDto.nameField} TEXT NOT NULL,
        ${FavoriteBreedsLocalDto.temperamentField} TEXT,
        ${FavoriteBreedsLocalDto.lifeSpanMinField} INTEGER,
        ${FavoriteBreedsLocalDto.lifeSpanMaxField} INTEGER,
        ${FavoriteBreedsLocalDto.originField} TEXT,
        ${FavoriteBreedsLocalDto.groupField} TEXT,
        ${FavoriteBreedsLocalDto.imageField} TEXT,
        ${FavoriteBreedsLocalDto.isFavoriteField} INTEGER NOT NULL 
      )
    ''');
  }
}
