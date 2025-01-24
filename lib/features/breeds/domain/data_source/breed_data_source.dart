import 'package:van_dog/features/breeds/domain/entities/breed.dart';

abstract class BreedDataSource {
  Future<List<Breed>> getBreeds();
  Future<Breed> getBreedById(int breedId);
  Future<List<Breed>> searchBreeds(
    String query,
  );
}
