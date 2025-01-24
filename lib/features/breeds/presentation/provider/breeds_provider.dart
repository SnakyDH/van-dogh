import 'dart:async';

import 'package:flutter/material.dart';
import 'package:van_dog/config/dependency_injection/di.dart';
import 'package:van_dog/features/breeds/domain/entities/breed.dart';
import 'package:van_dog/features/breeds/infrastructure/api/exception/breeds_not_found_exception.dart';
import 'package:van_dog/features/breeds/infrastructure/external/repository/breed_repository_impl.dart';

class BreedsProvider extends ChangeNotifier {
  final BreedRepositoryImpl _breedRepository = getIt.get<BreedRepositoryImpl>();
  List<Breed> breeds = [];
  List<Breed> breedsFiltered = [];
  bool isLoading = false;
  String? errorMessage;

  Timer? _debounce;

  Future<void> getBreeds() async {
    errorMessage = null;
    breeds = await _breedRepository.getBreeds();
    breedsFiltered = breeds;
    if (breeds.isEmpty) {
      errorMessage = BreedsNotFoundException.message;
    }
    notifyListeners();
  }

  Future<void> filterBreeds(String query) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      errorMessage = null;
      if (query.isEmpty) {
        breedsFiltered = breeds;
        errorMessage = null;
        notifyListeners();
        return;
      }
      notifyListeners();

      try {
        breedsFiltered = await _breedRepository.searchBreeds(query);
      } on BreedsNotFoundException catch (_) {
        breedsFiltered = breeds;
        errorMessage = BreedsNotFoundException.message;
      } catch (e) {
        errorMessage = e.toString();
      }
      isLoading = false;
      notifyListeners();
    });
  }
}
