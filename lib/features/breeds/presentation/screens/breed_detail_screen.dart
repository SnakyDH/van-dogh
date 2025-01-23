import 'package:flutter/material.dart';
import 'package:van_dog/config/router/app_route_names.dart';

class BreedDetailScreen extends StatelessWidget {
  static const String routeName = AppRouteNames.breedDetailScreen;
  final String breedId;

  const BreedDetailScreen({
    super.key,
    required this.breedId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Breed Detail"),
      ),
      body: Center(
        child: Hero(
          tag: int.parse(breedId),
          child: Image.network(
            "https://cdn2.thedogapi.com/images/BFRYBufpm.jpg",
          ),
        ),
      ),
    );
  }
}
