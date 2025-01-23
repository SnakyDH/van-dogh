import 'package:flutter/material.dart';
import 'package:van_dog/config/dependency_injection/di.dart';
import 'package:van_dog/features/breeds/domain/entities/breed.dart';
import 'package:van_dog/features/breeds/infrastructure/external/repository/breed_repository_impl.dart';

class BreedDetailProvider extends ChangeNotifier {
  final BreedRepositoryImpl _breedRepository = getIt.get<BreedRepositoryImpl>();
  Breed? breed;
  bool isLoading = false;

  Future<void> getBreed(int breedId) async {
    isLoading = true;
    notifyListeners();

    breed = await _breedRepository.getBreedById(breedId);
    isLoading = false;

    notifyListeners();
  }
}
