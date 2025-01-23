class BreedLifeSpan {
  final int min;
  final int max;

  BreedLifeSpan({
    required this.min,
    required this.max,
  });
  get isSame => min == max;
}
