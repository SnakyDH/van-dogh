import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:van_dog/features/breeds/presentation/provider/breed_detail_provider.dart';
import 'package:van_dog/features/breeds/presentation/screens/breed_detail_screen.dart';
import 'package:van_dog/features/breeds/presentation/screens/breeds_screen.dart';
import 'package:van_dog/features/favorite//presentation/screens/favorites_screen.dart';
import 'package:van_dog/features/home/presentation/layouts/home_layout.dart';
import 'package:van_dog/features/splash/presentation/screens/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
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
          routes: [
            GoRoute(
              path: "/:id",
              name: BreedDetailScreen.routeName,
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return ChangeNotifierProvider<BreedDetailProvider>(
                  create: (_) {
                    final provider = BreedDetailProvider();
                    provider.getBreed(int.parse(id));
                    return provider;
                  },
                  child: BreedDetailScreen(
                    breedId: id,
                  ),
                );
              },
            )
          ],
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
