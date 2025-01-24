import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:van_dog/features/breeds/presentation/screens/breeds_screen.dart';
import 'package:van_dog/features/favorites/presentation/screens/favorites_screen.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({super.key});

  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  int _selectedIndex = 0;

  void _onDestinationSelected(int index) {
    setState(() => _selectedIndex = index);
    switch (_selectedIndex) {
      case 0:
        context.goNamed(BreedsScreen.routeName);
        break;
      case 1:
        context.goNamed(FavoritesScreen.routeName);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: _onDestinationSelected,
      selectedIndex: _selectedIndex,
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.pets),
          label: S.of(context)!.breeds,
        ),
        NavigationDestination(
          icon: Badge(
            // todo: implement badge by favorite count
            //label: Text('1'),
            child: Icon(Icons.favorite),
          ),
          label: S.of(context)!.favorites,
        ),
      ],
    );
  }
}
