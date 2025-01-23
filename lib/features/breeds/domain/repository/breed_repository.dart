import 'package:van_dog/features/breeds/domain/entities/breed.dart';

abstract class BreedRepository {
  Future<List<Breed>> getBreeds();
  Future<Breed> getBreedById(int breedId);
}
