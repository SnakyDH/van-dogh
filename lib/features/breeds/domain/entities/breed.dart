import 'package:van_dog/features/breeds/domain/entities/breed_life_span.dart';

class Breed {
  final int id;
  final String name;
  final String imageUrl;
  final String group;
  final BreedLifeSpan lifeSpan;
  final String? origin;
  final List<String>? temperaments;
  bool isFavorite = false;

  Breed({
    required this.id,
    required this.name,
    required String imageUrl,
    this.group = "",
    required this.lifeSpan,
    required this.origin,
    this.temperaments,
    this.isFavorite = false,
  }) : imageUrl = imageUrl.contains("http")
            ? imageUrl
            : "https://cdn2.thedogapi.com/images/$imageUrl.jpg";

  void like() {
    isFavorite = !isFavorite;
  }
}
