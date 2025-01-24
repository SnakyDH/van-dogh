import 'package:van_dog/features/breeds/domain/entities/breed.dart';

abstract class FavoriteBreedsRepository {
  Future<bool> addFavorite(Breed id);
  Future<bool> removeFavorite(String id);
  Future<List<Breed>> getFavorites();
}
