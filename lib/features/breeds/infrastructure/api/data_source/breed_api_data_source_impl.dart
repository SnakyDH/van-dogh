import 'package:van_dog/config/api/api_service.dart';
import 'package:van_dog/features/breeds/domain/data_source/breed_data_source.dart';
import 'package:van_dog/features/breeds/domain/entities/breed.dart';
import 'package:van_dog/features/breeds/infrastructure/api/exception/breeds_not_found_exception.dart';
import 'package:van_dog/features/breeds/infrastructure/api/mappers/breed_api_mapper.dart';

class BreedApiDataSourceImpl implements BreedDataSource {
  final BreedApiMapper _breedApiMapper = BreedApiMapper();
  @override
  Future<List<Breed>> getBreeds() async {
    final response = await ApiService.instance.get('v1/breeds?limit=10&page=0');
    final List<dynamic> list = response.data;
    return _breedApiMapper.getBreedsApiResponseDtoToBreedList(list);
  }

  @override
  Future<Breed> getBreedById(int breedId) async {
    final response = await ApiService.instance.get(
      'v1/breeds/$breedId',
    );
    final Map<String, dynamic> data = response.data;
    return _breedApiMapper.getBreedApiResponseDtoToBreed(data);
  }

  @override
  Future<List<Breed>> searchBreeds(String query) async {
    final response = await ApiService.instance.get('v1/breeds/search?q=$query');

    final List<dynamic> list = response.data;
    if (list.isEmpty) {
      throw BreedsNotFoundException();
    }
    return _breedApiMapper.getBreedsSearchApiResponseDtoToBreedList(list);
  }
}
