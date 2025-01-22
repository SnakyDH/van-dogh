import 'package:flutter/material.dart';
import 'package:van_dog/config/router/app_route_names.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:van_dog/features/breeds/domain/entities/breed.dart';
import 'package:van_dog/features/breeds/presentation/widgets/breed_card.dart';

class BreedsScreen extends StatelessWidget {
  const BreedsScreen({super.key});

  static const String routeName = AppRouteNames.breedsScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context)!.breeds,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              SearchBar(),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index % 3 == 0) {
                    return BreedCard(
                      breedName: "Akita",
                      breedGroup: "Working",
                      image: "https://cdn2.thedogapi.com/images/BFRYBufpm.jpg",
                      breedId: index,
                      lifeSpan: BreedLifeSpan(min: 10, max: 14),
                      isFavorite: true,
                    );
                  }

                  return BreedCard(
                    breedName: "Afghan Hound",
                    breedGroup: "Hound",
                    image: "https://cdn2.thedogapi.com/images/hMyT4CDXR.jpg",
                    breedId: index,
                    lifeSpan: BreedLifeSpan(min: 10, max: 14),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
