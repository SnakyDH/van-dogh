import 'package:van_dog/features/breeds/domain/entities/breed.dart';

abstract class FavoriteBreedsDataSource {
  Future<bool> addFavorite(Breed breed);
  Future<bool> removeFavorite(String id);
  Future<List<Breed>> getFavorites();
}
