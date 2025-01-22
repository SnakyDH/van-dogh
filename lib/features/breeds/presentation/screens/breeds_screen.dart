import 'package:flutter/material.dart';
import 'package:van_dog/config/router/app_route_names.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

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
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
