class BreedLifeSpan {
  final int min;
  final int max;

  BreedLifeSpan({
    required this.min,
    required this.max,
  });
  bool get isSame => min == max;

  Map<String, int> toMap() {
    return {
      'min': min,
      'max': max,
    };
  }

  factory BreedLifeSpan.fromMap(Map<String, dynamic> map) {
    return BreedLifeSpan(
      min: map['min'],
      max: map['max'],
    );
  }
}
