import 'package:flutter/material.dart';
import 'package:van_dog/features/home/presentation/widgets/app_bottom_navigation.dart';

class HomeLayout extends StatelessWidget {
  final Widget child;
  const HomeLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomNavigation(),
    );
  }
}
