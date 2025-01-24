import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:van_dog/config/router/app_route_names.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:van_dog/features/breeds/infrastructure/api/exception/breeds_not_found_exception.dart';
import 'package:van_dog/features/breeds/presentation/widgets/breed_card.dart';
import 'package:van_dog/features/favorite/presentation/provider/favorite_breed_provider.dart';

class FavoritesScreen extends StatefulWidget {
  static const String routeName = AppRouteNames.favoritesScreen;

  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBreedProvider>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final breedList = context.watch<FavoriteBreedProvider>().favoriteBreeds;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context)!.favorites,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 20,
            children: [
              if (context.watch<FavoriteBreedProvider>().errorMessage ==
                  BreedsNotFoundException.message)
                Text(
                  S.of(context)!.breedNotFound,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineLarge!.copyWith(
                    color: appColors.error,
                  ),
                )
              else if (breedList.isEmpty)
                const Center(child: CircularProgressIndicator())
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: breedList.length,
                  itemBuilder: (context, index) {
                    final breed = breedList[index];
                    return BreedCard(
                      breedId: breed.id,
                      breedName: breed.name,
                      image: breed.imageUrl,
                      lifeSpan: breed.lifeSpan,
                      breedGroup: breed.group,
                      isFavorite: breed.isFavorite,
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
