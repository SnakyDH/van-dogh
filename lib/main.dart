import 'package:flutter/material.dart';

import 'package:van_dog/config/theme/app_color_theme.dart';
import 'package:van_dog/config/theme/app_font_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: appFontTheme,
        colorScheme: appColorTheme,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hello World!',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
