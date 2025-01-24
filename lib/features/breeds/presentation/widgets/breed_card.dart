import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:van_dog/features/breeds/domain/entities/breed_life_span.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:van_dog/features/breeds/presentation/screens/breed_detail_screen.dart';
import 'package:van_dog/features/favorite/presentation/provider/favorite_breed_provider.dart';

class BreedCard extends StatelessWidget {
  final String breedName;
  final String breedGroup;
  final String image;
  final int breedId;
  final BreedLifeSpan lifeSpan;
  final bool isFavorite;

  const BreedCard({
    super.key,
    required this.breedName,
    required this.breedGroup,
    required this.image,
    required this.breedId,
    required this.lifeSpan,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Hero(
      tag: breedId,
      child: GestureDetector(
        onTap: () => context.pushNamed(
          BreedDetailScreen.routeName,
          pathParameters: {
            "id": breedId.toString(),
          },
        ),
        child: Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 120,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        breedName,
                        textAlign: TextAlign.center,
                        style: textTheme.titleLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        breedGroup,
                        style: textTheme.bodyLarge,
                      ),
                      Text(
                        lifeSpan.isSame
                            ? S.of(context)!.years(lifeSpan.min)
                            : S.of(context)!.yearsRange(
                                  lifeSpan.min,
                                  lifeSpan.max,
                                ),
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: AddFavoriteButton(
                  isFavorite: isFavorite,
                  breedId: breedId,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddFavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final int breedId;

  const AddFavoriteButton({
    super.key,
    required this.breedId,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () => !isFavorite
            ? context.read<FavoriteBreedProvider>().addFavorite(breedId)
            : context.read<FavoriteBreedProvider>().removeFavorite(breedId),
      ),
    );
  }
}
