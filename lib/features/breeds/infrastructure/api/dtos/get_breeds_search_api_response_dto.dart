class GetBreedsSearchApiResponseDto {
  final Eight weight;
  final Eight height;
  final int id;
  final String name;
  final String? bredFor;
  final BreedGroup? breedGroup;
  final String lifeSpan;
  final String? temperament;
  final String? origin;
  final String referenceImageId;
  final CountryCode? countryCode;
  final String? description;
  final String? history;

  GetBreedsSearchApiResponseDto({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    this.bredFor,
    this.breedGroup,
    required this.lifeSpan,
    this.temperament,
    this.origin,
    required this.referenceImageId,
    this.countryCode,
    this.description,
    this.history,
  });

  factory GetBreedsSearchApiResponseDto.fromJson(Map<String, dynamic> json) =>
      GetBreedsSearchApiResponseDto(
        weight: Eight.fromJson(json["weight"]),
        height: Eight.fromJson(json["height"]),
        id: json["id"],
        name: json["name"],
        bredFor: json["bred_for"],
        breedGroup:
            breedGroupValues.map[json["breed_group"]] ?? BreedGroup.EMPTY,
        lifeSpan: json["life_span"],
        temperament: json["temperament"],
        origin: json["origin"],
        referenceImageId: json["reference_image_id"],
        countryCode:
            countryCodeValues.map[json["country_code"]] ?? CountryCode.UNKNOWN,
        description: json["description"],
        history: json["history"],
      );

  Map<String, dynamic> toJson() => {
        "weight": weight.toJson(),
        "height": height.toJson(),
        "id": id,
        "name": name,
        "bred_for": bredFor,
        "breed_group": breedGroupValues.reverse[breedGroup],
        "life_span": lifeSpan,
        "temperament": temperament,
        "origin": origin,
        "reference_image_id": referenceImageId,
        "country_code": countryCodeValues.reverse[countryCode],
        "description": description,
        "history": history,
      };
}

enum BreedGroup {
  EMPTY,
  HERDING,
  HOUND,
  MIXED,
  NON_SPORTING,
  SPORTING,
  TERRIER,
  TOY,
  WORKING
}

final breedGroupValues = EnumValues({
  "": BreedGroup.EMPTY,
  "Herding": BreedGroup.HERDING,
  "Hound": BreedGroup.HOUND,
  "Mixed": BreedGroup.MIXED,
  "Non-Sporting": BreedGroup.NON_SPORTING,
  "Sporting": BreedGroup.SPORTING,
  "Terrier": BreedGroup.TERRIER,
  "Toy": BreedGroup.TOY,
  "Working": BreedGroup.WORKING
});

enum CountryCode { AG, AU, US, UNKNOWN }

final countryCodeValues = EnumValues(
    {"AG": CountryCode.AG, "AU": CountryCode.AU, "US": CountryCode.US});

class Eight {
  final String imperial;
  final String metric;

  Eight({
    required this.imperial,
    required this.metric,
  });

  factory Eight.fromJson(Map<String, dynamic> json) => Eight(
        imperial: json["imperial"],
        metric: json["metric"],
      );

  Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
