import 'package:van_dog/features/breeds/domain/data_source/breed_data_source.dart';
import 'package:van_dog/features/breeds/domain/entities/breed.dart';
import 'package:van_dog/features/breeds/domain/repository/breed_repository.dart';

class BreedRepositoryImpl implements BreedRepository {
  final BreedDataSource _dataSource;

  BreedRepositoryImpl(this._dataSource);
  @override
  Future<List<Breed>> getBreeds() {
    return _dataSource.getBreeds();
  }

  @override
  Future<Breed> getBreedById(int breedId) {
    return _dataSource.getBreedById(breedId);
  }

  @override
  Future<List<Breed>> searchBreeds(String query) {
    return _dataSource.searchBreeds(query);
  }
}
