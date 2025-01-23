import 'package:van_dog/features/breeds/domain/entities/breed.dart';
import 'package:van_dog/features/breeds/domain/entities/breed_life_span.dart';
import 'package:van_dog/features/breeds/infrastructure/api/dtos/get_breeds_api_response_dto.dart';

class BreedApiMapper {
  List<Breed> getBreedApiResponseDtoToBreedList(List<dynamic> list) {
    return list.map((e) {
      final responseData = GetBreedsApiResponseDto.fromJson(e);
      final lifeSpanCalculated = _calculateLifeSpan(responseData.lifeSpan);

      return Breed(
        id: responseData.id,
        name: responseData.name,
        imageUrl: responseData.image.url,
        group: responseData.breedGroup ?? '',
        lifeSpan: lifeSpanCalculated,
        temperament: responseData.temperament.trim().split(','),
      );
    }).toList();
  }

  BreedLifeSpan _calculateLifeSpan(String lifeSpan) {
    final List<int> list = lifeSpan.replaceAll(" ", "").split('-').map(
      (e) {
        final String withOutYears = e.replaceFirst("years", "");
        return int.parse(withOutYears);
      },
    ).toList();
    if (list.length == 1) {
      return BreedLifeSpan(min: list[0], max: list[0]);
    }
    return BreedLifeSpan(min: list[0], max: list[1]);
  }
}
