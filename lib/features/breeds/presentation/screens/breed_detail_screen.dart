import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:van_dog/config/router/app_route_names.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:van_dog/config/theme/app_color_theme.dart';
import 'package:van_dog/features/breeds/presentation/provider/breed_detail_provider.dart';

class BreedDetailScreen extends StatefulWidget {
  static const String routeName = AppRouteNames.breedDetailScreen;
  final String breedId;

  const BreedDetailScreen({
    super.key,
    required this.breedId,
  });

  @override
  State<BreedDetailScreen> createState() => _BreedDetailScreenState();
}

class _BreedDetailScreenState extends State<BreedDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final breedProvider = context.watch<BreedDetailProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: breedProvider.isLoading
            ? const CircularProgressIndicator()
            : breedProvider.breed == null
                ? Text(
                    S.of(context)!.breedNotFound,
                    style: textTheme.displayMedium,
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        Text(
                          breedProvider.breed!.name,
                          style: textTheme.displayLarge,
                          textAlign: TextAlign.center,
                        ),
                        Hero(
                          tag: int.parse(widget.breedId),
                          child: SizedBox(
                            height: 200,
                            child: Image.network(
                              breedProvider.breed!.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (breedProvider.breed!.origin != null &&
                            breedProvider.breed!.origin!.isNotEmpty)
                          Text(
                            breedProvider.breed!.origin!,
                            style: textTheme.displaySmall,
                          ),
                        if (breedProvider.breed!.origin == null ||
                            breedProvider.breed!.origin!.isEmpty)
                          Text(
                            S.of(context)!.originNotFound,
                            style: textTheme.displaySmall,
                          ),
                        Text(
                          breedProvider.breed!.lifeSpan.isSame
                              ? S.of(context)!.years(
                                    breedProvider.breed!.lifeSpan.min,
                                  )
                              : S.of(context)!.yearsRange(
                                    breedProvider.breed!.lifeSpan.min,
                                    breedProvider.breed!.lifeSpan.max,
                                  ),
                          style: textTheme.titleLarge,
                        ),
                        if (breedProvider.breed!.group.isNotEmpty)
                          Text(
                            breedProvider.breed!.group,
                            style: textTheme.displaySmall,
                          ),
                        if (breedProvider.breed!.temperaments != null)
                          BreedDetailTemperamentsGrid(
                            temperaments: breedProvider.breed!.temperaments!,
                          ),
                      ],
                    ),
                  ),
      ),
    );
  }
}

class BreedDetailTemperamentsGrid extends StatelessWidget {
  final List<String> temperaments;

  const BreedDetailTemperamentsGrid({
    super.key,
    required this.temperaments,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: temperaments.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.black.withValues(
                alpha: 0.1,
              ),
              child: Center(
                child: Text(
                  temperaments[index],
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColorConstants.onSurface,
                      ),
                ),
              ),
            );
          }),
    );
  }
}
