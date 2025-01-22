class Breed {
  final String name;
  final String temperament;
  final String origin;
  final String description;
  final BreedLifeSpan lifeSpan;

  Breed({
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.lifeSpan,
  });
}

class BreedLifeSpan {
  final int min;
  final int max;

  BreedLifeSpan({
    required this.min,
    required this.max,
  });
}
