import 'package:van_dog/features/breeds/domain/entities/breed.dart';
import 'package:van_dog/features/breeds/domain/entities/breed_life_span.dart';
import 'package:van_dog/features/breeds/infrastructure/api/dtos/get_breed_api_response_dto.dart';
import 'package:van_dog/features/breeds/infrastructure/api/dtos/get_breeds_api_response_dto.dart';
import 'package:van_dog/features/breeds/infrastructure/api/dtos/get_breeds_search_api_response_dto.dart';

class BreedApiMapper {
  List<Breed> getBreedsSearchApiResponseDtoToBreedList(List<dynamic> list) {
    return list.map((e) {
      final responseData = GetBreedsSearchApiResponseDto.fromJson(e);
      final lifeSpanCalculated = _calculateLifeSpan(responseData.lifeSpan);

      return Breed(
        id: responseData.id,
        name: responseData.name,
        imageUrl: responseData.referenceImageId,
        group: responseData.breedGroup?.name ?? '',
        lifeSpan: lifeSpanCalculated,
        origin: responseData.origin,
        temperaments: responseData.temperament?.trim().split(',') ?? [],
      );
    }).toList();
  }

  Breed getBreedApiResponseDtoToBreed(Map<String, dynamic> dto) {
    final responseData = GetBreedApiResponseDto.fromJson(dto);
    final lifeSpanCalculated = _calculateLifeSpan(
      responseData.lifeSpan,
    );

    return Breed(
      id: responseData.id,
      name: responseData.name,
      imageUrl: responseData.referenceImageId,
      group: responseData.breedGroup ?? "",
      lifeSpan: lifeSpanCalculated,
      origin: responseData.origin,
      temperaments: responseData.temperament.trim().split(','),
    );
  }

  List<Breed> getBreedsApiResponseDtoToBreedList(List<dynamic> list) {
    return list.map((e) {
      final responseData = GetBreedsApiResponseDto.fromJson(e);
      final lifeSpanCalculated = _calculateLifeSpan(responseData.lifeSpan);

      return Breed(
        id: responseData.id,
        name: responseData.name,
        imageUrl: responseData.image?.url ?? '',
        group: responseData.breedGroup ?? '',
        lifeSpan: lifeSpanCalculated,
        origin: null,
        temperaments: responseData.temperament.trim().split(','),
      );
    }).toList();
  }

  BreedLifeSpan _calculateLifeSpan(String lifeSpan) {
    final data = lifeSpan.replaceAll(" ", "").split(RegExp(r"-|–"));

    final List<int> list = data.map(
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
