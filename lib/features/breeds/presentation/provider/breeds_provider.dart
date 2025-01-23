import 'package:flutter/material.dart';
import 'package:van_dog/config/dependency_injection/di.dart';
import 'package:van_dog/features/breeds/domain/entities/breed.dart';
import 'package:van_dog/features/breeds/infrastructure/external/repository/breed_repository_impl.dart';

class BreedsProvider extends ChangeNotifier {
  final BreedRepositoryImpl _breedRepository = getIt.get<BreedRepositoryImpl>();
  List<Breed> _breeds = [];
  List<Breed> _breedsFiltered = [];

  List<Breed> get breeds => _breeds;
  List<Breed> get breedsFiltered => _breedsFiltered;

  Future<void> getBreeds() async {
    _breeds = await _breedRepository.getBreeds();
    _breedsFiltered = _breeds;
    notifyListeners();
  }
}
