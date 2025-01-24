import 'package:get_it/get_it.dart';
import 'package:van_dog/features/breeds/infrastructure/api/data_source/breed_api_data_source_impl.dart';
import 'package:van_dog/features/breeds/infrastructure/external/repository/breed_repository_impl.dart';
import 'package:van_dog/features/breeds/presentation/provider/breeds_provider.dart';
import 'package:van_dog/features/favorite/infrastructure/local/data_source/favorite_breeds_local_data_source_impl.dart';
import 'package:van_dog/features/favorite/infrastructure/local/repository/favorite_breeds_repository_impl.dart';
import 'package:van_dog/features/favorite/presentation/provider/favorite_breed_provider.dart';

final getIt = GetIt.instance;

void getItSetup() {
  /// * Register repository dependencies
  getIt.registerSingleton<BreedRepositoryImpl>(
    BreedRepositoryImpl(
      BreedApiDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<FavoriteBreedsRepositoryImpl>(
    FavoriteBreedsRepositoryImpl(
      FavoriteBreedsLocalDataSourceImpl(),
    ),
  );

  /// * Register provider dependencies
  getIt.registerSingleton<BreedsProvider>(
    BreedsProvider(),
  );

  getIt.registerSingleton<FavoriteBreedProvider>(
    FavoriteBreedProvider(
      breedsProvider: getIt.get<BreedsProvider>(),
    ),
  );
}
