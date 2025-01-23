class GetBreedAndImageResponseDto {
  final List<GetBreedResponseDto> breeds;
  final String id;
  final String url;
  final int width;
  final int height;

  GetBreedAndImageResponseDto({
    required this.breeds,
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory GetBreedAndImageResponseDto.fromJson(Map<String, dynamic> json) =>
      GetBreedAndImageResponseDto(
        breeds: List<GetBreedResponseDto>.from(
          json["breeds"].map((x) => GetBreedResponseDto.fromJson(x)),
        ),
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "breeds": List<dynamic>.from(breeds.map((x) => x.toJson())),
        "id": id,
        "url": url,
        "width": width,
        "height": height,
      };
}

class GetBreedResponseDto {
  final Eight weight;
  final Eight height;
  final int id;
  final String name;
  final String? countryCode;
  final String? bredFor;
  final String? breedGroup;
  final String lifeSpan;
  final String temperament;
  final String referenceImageId;

  GetBreedResponseDto({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    this.countryCode,
    this.bredFor,
    this.breedGroup,
    required this.lifeSpan,
    required this.temperament,
    required this.referenceImageId,
  });

  factory GetBreedResponseDto.fromJson(Map<String, dynamic> json) =>
      GetBreedResponseDto(
        weight: Eight.fromJson(json["weight"]),
        height: Eight.fromJson(json["height"]),
        id: json["id"],
        name: json["name"],
        countryCode: json["country_code"],
        bredFor: json["bred_for"],
        breedGroup: json["breed_group"],
        lifeSpan: json["life_span"],
        temperament: json["temperament"],
        referenceImageId: json["reference_image_id"],
      );

  Map<String, dynamic> toJson() => {
        "weight": weight.toJson(),
        "height": height.toJson(),
        "id": id,
        "name": name,
        "country_code": countryCode,
        "bred_for": bredFor,
        "breed_group": breedGroup,
        "life_span": lifeSpan,
        "temperament": temperament,
        "reference_image_id": referenceImageId,
      };
}

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
