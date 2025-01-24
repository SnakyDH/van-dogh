import 'package:van_dog/features/breeds/domain/entities/breed.dart';
import 'package:van_dog/features/breeds/domain/entities/breed_life_span.dart';
import 'package:van_dog/features/favorite/infrastructure/local/dto/favorite_breeds_local_dto.dart';

class FavoriteBreedsLocalMapper {
  static Map<String, dynamic> toMap(Breed breed) {
    return {
      FavoriteBreedsLocalDto.idField: breed.id,
      FavoriteBreedsLocalDto.nameField: breed.name,
      FavoriteBreedsLocalDto.temperamentField:
          breed.temperaments?.join(',') ?? '',
      FavoriteBreedsLocalDto.lifeSpanMinField: breed.lifeSpan.min,
      FavoriteBreedsLocalDto.lifeSpanMaxField: breed.lifeSpan.max,
      FavoriteBreedsLocalDto.originField: breed.origin,
      FavoriteBreedsLocalDto.groupField: breed.group,
      FavoriteBreedsLocalDto.imageField: breed.imageUrl,
      FavoriteBreedsLocalDto.isFavoriteField: breed.isFavorite,
    };
  }

  static Breed fromMap(Map<String, dynamic> dto) {
    return Breed(
      id: int.parse(dto[FavoriteBreedsLocalDto.idField]),
      name: dto[FavoriteBreedsLocalDto.nameField],
      temperaments: dto[FavoriteBreedsLocalDto.temperamentField].split(','),
      lifeSpan: BreedLifeSpan(
        min: dto[FavoriteBreedsLocalDto.lifeSpanMinField],
        max: dto[FavoriteBreedsLocalDto.lifeSpanMaxField],
      ),
      origin: dto[FavoriteBreedsLocalDto.originField],
      group: dto[FavoriteBreedsLocalDto.groupField],
      imageUrl: dto[FavoriteBreedsLocalDto.imageField],
      // * This is a bool field, so we need to convert it to int
      isFavorite: dto[FavoriteBreedsLocalDto.isFavoriteField] == 1,
    );
  }
}
