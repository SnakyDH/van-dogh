import 'package:van_dog/features/breeds/domain/entities/breed.dart';
import 'package:van_dog/features/breeds/domain/entities/breed_life_span.dart';
import 'package:van_dog/features/breeds/infrastructure/api/dtos/get_breed_api_response_dto.dart';
import 'package:van_dog/features/breeds/infrastructure/api/dtos/get_breeds_api_response_dto.dart';

class BreedApiMapper {
  Breed getBreedApiResponseDtoToBreed(Map<String, dynamic> dto) {
    final responseData = GetBreedAndImageResponseDto.fromJson(dto);
    final breed = responseData.breeds.first;
    final lifeSpanCalculated = _calculateLifeSpan(
      breed.lifeSpan,
    );

    return Breed(
      id: breed.id,
      name: breed.name,
      imageUrl: responseData.url,
      group: breed.breedGroup ?? "",
      lifeSpan: lifeSpanCalculated,
      temperaments: breed.temperament.trim().split(','),
    );
  }

  List<Breed> getBreedsApiResponseDtoToBreedList(List<dynamic> list) {
    return list.map((e) {
      final responseData = GetBreedsApiResponseDto.fromJson(e);
      final lifeSpanCalculated = _calculateLifeSpan(responseData.lifeSpan);

      return Breed(
        id: responseData.id,
        name: responseData.name,
        imageUrl: responseData.image.url,
        group: responseData.breedGroup ?? '',
        lifeSpan: lifeSpanCalculated,
        temperaments: responseData.temperament.trim().split(','),
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
