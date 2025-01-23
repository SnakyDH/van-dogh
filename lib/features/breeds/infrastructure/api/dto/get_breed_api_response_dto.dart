class GetBreedApiResponseDto {
  final Eight weight;
  final Eight height;
  final int id;
  final String name;
  final String? countryCode;
  final String bredFor;
  final String? breedGroup;
  final String lifeSpan;
  final String temperament;
  final String referenceImageId;
  final Image image;

  GetBreedApiResponseDto({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    this.countryCode,
    required this.bredFor,
    this.breedGroup,
    required this.lifeSpan,
    required this.temperament,
    required this.referenceImageId,
    required this.image,
  });

  factory GetBreedApiResponseDto.fromJson(Map<String, dynamic> json) =>
      GetBreedApiResponseDto(
        weight: Eight.fromJson(json["weight"]),
        height: Eight.fromJson(json["height"]),
        id: json["id"],
        name: json["name"],
        countryCode: json["country_code"],
        bredFor: json["bred_for"] ?? '',
        breedGroup: json["breed_group"],
        lifeSpan: json["life_span"],
        temperament: json["temperament"],
        referenceImageId: json["reference_image_id"],
        image: Image.fromJson(json["image"]),
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
        "image": image.toJson(),
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

class Image {
  final String id;
  final int width;
  final int height;
  final String url;

  Image({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
      };
}
