import 'package:go_router/go_router.dart';
import 'package:van_dog/features/home/presentation/screens/home_screen.dart';
import 'package:van_dog/features/splash/presentation/screens/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: SplashScreen.routeName,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: "/home",
      name: HomeScreen.routeName,
      builder: (context, state) => HomeScreen(),
    )
  ],
);
