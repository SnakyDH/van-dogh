class GetBreedApiResponseDto {
  final int id;
  final String name;
  final String? bredFor;
  final String? breedGroup;
  final String lifeSpan;
  final String temperament;
  final String? origin;
  final String referenceImageId;

  GetBreedApiResponseDto({
    required this.id,
    required this.name,
    required this.bredFor,
    required this.breedGroup,
    required this.lifeSpan,
    required this.temperament,
    required this.origin,
    required this.referenceImageId,
  });

  factory GetBreedApiResponseDto.fromJson(Map<String, dynamic> json) =>
      GetBreedApiResponseDto(
        id: json["id"],
        name: json["name"],
        bredFor: json["bred_for"],
        breedGroup: json["breed_group"],
        lifeSpan: json["life_span"],
        temperament: json["temperament"],
        origin: json["origin"],
        referenceImageId: json["reference_image_id"],
      );
}
