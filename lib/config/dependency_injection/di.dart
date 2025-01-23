import 'package:get_it/get_it.dart';
import 'package:van_dog/features/breeds/infrastructure/api/data_source/breed_api_data_source_impl.dart';
import 'package:van_dog/features/breeds/infrastructure/external/repository/breed_repository_impl.dart';
import 'package:van_dog/features/breeds/presentation/provider/breeds_provider.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<BreedRepositoryImpl>(
    BreedRepositoryImpl(
      BreedApiDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<BreedsProvider>(
    BreedsProvider(),
  );
}
