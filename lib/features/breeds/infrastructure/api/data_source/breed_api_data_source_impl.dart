import 'package:van_dog/config/api/api_service.dart';
import 'package:van_dog/features/breeds/domain/data_source/breed_data_source.dart';
import 'package:van_dog/features/breeds/domain/entities/breed.dart';
import 'package:van_dog/features/breeds/infrastructure/api/mappers/breed_api_mapper.dart';

class BreedApiDataSourceImpl implements BreedDataSource {
  final BreedApiMapper _breedApiMapper = BreedApiMapper();
  @override
  Future<List<Breed>> getBreeds() async {
    final response = await ApiService.instance.get('v1/breeds?limit=10&page=0');
    final List<dynamic> list = response.data;
    return _breedApiMapper.getBreedApiResponseDtoToBreedList(list);
  }
}
