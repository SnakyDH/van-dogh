class BreedLifeSpan {
  final int min;
  final int max;

  BreedLifeSpan({
    required this.min,
    required this.max,
  });
  bool get isSame => min == max;
}
