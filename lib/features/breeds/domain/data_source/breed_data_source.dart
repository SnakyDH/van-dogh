import 'package:van_dog/features/breeds/domain/entities/breed.dart';

abstract class BreedDataSource {
  Future<List<Breed>> getBreeds();
}
