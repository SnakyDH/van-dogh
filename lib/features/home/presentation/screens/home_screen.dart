import 'package:flutter/material.dart';
import 'package:van_dog/config/router/app_route_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = AppRouteNames.homeScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
