import 'package:van_dog/features/breeds/domain/entities/breed_life_span.dart';

class Breed {
  final int id;
  final String name;
  final String imageUrl;
  final String group;
  final BreedLifeSpan lifeSpan;
  final List<String>? temperaments;
  bool isFavorite = false;

  Breed({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.group,
    required this.lifeSpan,
    this.temperaments,
    this.isFavorite = false,
  });
  factory Breed.empty() => Breed(
        id: 0,
        name: '',
        imageUrl: '',
        group: '',
        lifeSpan: BreedLifeSpan(max: 0, min: 0),
      );
}
