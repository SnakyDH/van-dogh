import 'package:van_dog/features/breeds/domain/entities/breed.dart';
import 'package:van_dog/features/favorite/domain/data_source/favorite_breeds_data_source.dart';
import 'package:van_dog/features/favorite/domain/repository/favorite_breeds_repository.dart';

class FavoriteBreedsRepositoryImpl implements FavoriteBreedsRepository {
  final FavoriteBreedsDataSource _dataSource;

  FavoriteBreedsRepositoryImpl(this._dataSource);

  @override
  Future<bool> addFavorite(Breed breed) {
    return _dataSource.addFavorite(breed);
  }

  @override
  Future<List<Breed>> getFavorites() {
    return _dataSource.getFavorites();
  }

  @override
  Future<bool> removeFavorite(String id) {
    return _dataSource.removeFavorite(id);
  }
}
