import 'package:flutter/material.dart';
import 'package:van_dog/config/router/app_route_names.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class FavoritesScreen extends StatelessWidget {
  static const String routeName = AppRouteNames.favoritesScreen;

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context)!.favorites,
        ),
      ),
      body: const Center(
        child: Text('Favorites Screen'),
      ),
    );
  }
}
