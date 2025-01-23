import 'package:van_dog/features/breeds/domain/entities/breed_life_span.dart';

class Breed {
  final int id;
  final String name;
  final String imageUrl;
  final String group;
  final BreedLifeSpan lifeSpan;
  final List<String>? temperament;
  bool isFavorite = false;

  Breed({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.group,
    required this.lifeSpan,
    this.temperament,
    this.isFavorite = false,
  });
}
