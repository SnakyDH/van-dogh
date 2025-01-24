import 'package:flutter/material.dart';
import 'package:van_dog/config/dependency_injection/di.dart';
import 'package:van_dog/features/breeds/domain/entities/breed.dart';
import 'package:van_dog/features/breeds/infrastructure/api/exception/breeds_not_found_exception.dart';
import 'package:van_dog/features/breeds/presentation/provider/breeds_provider.dart';
import 'package:van_dog/features/favorite/domain/repository/favorite_breeds_repository.dart';
import 'package:van_dog/features/favorite/infrastructure/local/repository/favorite_breeds_repository_impl.dart';

class FavoriteBreedProvider extends ChangeNotifier {
  final FavoriteBreedsRepository _favoriteRepository =
      getIt.get<FavoriteBreedsRepositoryImpl>();

  bool isLoading = false;
  List<Breed> favoriteBreeds = [];
  final BreedsProvider breedsProvider;
  String errorMessage = '';

  FavoriteBreedProvider({required this.breedsProvider});

  Future<void> getFavorites() async {
    isLoading = true;
    errorMessage = '';

    try {
      final favorites = await _favoriteRepository.getFavorites();
      favoriteBreeds = favorites;
    } on BreedsNotFoundException {
      errorMessage = BreedsNotFoundException.message;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addFavorite(int breedId) async {
    isLoading = true;
    notifyListeners();
    final breed = breedsProvider.breedsFiltered
        .firstWhere((element) => element.id == breedId);
    breed.like();
    final isFavorite = await _favoriteRepository.addFavorite(breed);
    if (isFavorite) {
      favoriteBreeds.add(breed);
    }
    isLoading = false;

    notifyListeners();
  }

  Future<void> removeFavorite(int breedId) async {
    isLoading = true;
    notifyListeners();

    final isFavorite = await _favoriteRepository.removeFavorite(
      breedId.toString(),
    );
    if (isFavorite) {
      favoriteBreeds.removeWhere(
        (element) => element.id == breedId,
      );
    }
    isLoading = false;

    notifyListeners();
  }
}
