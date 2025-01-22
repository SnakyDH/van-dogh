import 'package:go_router/go_router.dart';
import 'package:van_dog/features/breeds/presentation/screens/breeds_screen.dart';
import 'package:van_dog/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:van_dog/features/home/presentation/layouts/home_layout.dart';
import 'package:van_dog/features/splash/presentation/screens/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/breeds",
  routes: [
    GoRoute(
      path: "/",
      name: SplashScreen.routeName,
      builder: (context, state) => SplashScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => HomeLayout(
        child: child,
      ),
      routes: [
        GoRoute(
          path: "/breeds",
          name: BreedsScreen.routeName,
          builder: (context, state) => BreedsScreen(),
        ),
        GoRoute(
          path: "/favorites",
          name: FavoritesScreen.routeName,
          builder: (context, state) => FavoritesScreen(),
        ),
      ],
    )
  ],
);
