import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:van_dog/config/router/app_route_names.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:van_dog/features/breeds/infrastructure/api/exception/breeds_not_found_exception.dart';
import 'package:van_dog/features/breeds/presentation/provider/breeds_provider.dart';
import 'package:van_dog/features/breeds/presentation/widgets/breed_card.dart';

class BreedsScreen extends StatefulWidget {
  const BreedsScreen({super.key});

  static const String routeName = AppRouteNames.breedsScreen;

  @override
  State<BreedsScreen> createState() => _BreedsScreenState();
}

class _BreedsScreenState extends State<BreedsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BreedsProvider>().getBreeds();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final breedList = context.watch<BreedsProvider>().breedsFiltered;

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
              BreedSearchBar(),
              if (breedList.isEmpty)
                CircularProgressIndicator()
              else if (context.watch<BreedsProvider>().errorMessage ==
                  BreedsNotFoundException.message)
                Text(
                  S.of(context)!.errorLoadingBreeds,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineLarge!.copyWith(
                    color: appColors.error,
                  ),
                )
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

class BreedSearchBar extends StatelessWidget {
  const BreedSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;

    return SearchBar(
      leading: Icon(
        Icons.search,
        color: appColors.surface,
      ),
      hintText: S.of(context)!.searchBreed,
      textStyle: WidgetStateProperty.all(
        TextStyle(color: appColors.surface),
      ),
      onChanged: context.read<BreedsProvider>().filterBreeds,
      backgroundColor: WidgetStateProperty.all(
        appColors.onSurface,
      ),
      hintStyle: WidgetStateProperty.all(
        TextStyle(color: appColors.surface),
      ),
    );
  }
}
