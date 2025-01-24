import 'package:sqflite/sqflite.dart';
import 'package:van_dog/config/local/database_service.dart';
import 'package:van_dog/features/breeds/domain/entities/breed.dart';
import 'package:van_dog/features/breeds/infrastructure/api/exception/breeds_not_found_exception.dart';
import 'package:van_dog/features/favorite/domain/data_source/favorite_breeds_data_source.dart';
import 'package:van_dog/features/favorite/infrastructure/local/dto/favorite_breeds_local_dto.dart';
import 'package:van_dog/features/favorite/infrastructure/local/mappers/favorite_breeds_local_mapper.dart';

class FavoriteBreedsLocalDataSourceImpl implements FavoriteBreedsDataSource {
  @override
  Future<bool> addFavorite(Breed breed) async {
    try {
      final Database db = await DatabaseService.instance.database;
      await db.insert(
        FavoriteBreedsLocalDto.table,
        FavoriteBreedsLocalMapper.toMap(breed),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Breed>> getFavorites() async {
    final Database db = await DatabaseService.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      FavoriteBreedsLocalDto.table,
    );
    final result =
        maps.map((e) => FavoriteBreedsLocalMapper.fromMap(e)).toList();
    if (result.isEmpty) {
      throw BreedsNotFoundException();
    }
    return result;
  }

  @override
  Future<bool> removeFavorite(String id) async {
    try {
      final Database db = await DatabaseService.instance.database;
      await db.delete(
        FavoriteBreedsLocalDto.table,
        where: 'id = ?',
        whereArgs: [id],
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
