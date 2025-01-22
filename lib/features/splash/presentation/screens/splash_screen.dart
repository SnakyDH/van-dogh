import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:van_dog/config/router/app_route_names.dart';
import 'package:van_dog/features/home/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = AppRouteNames.splashScreen;

  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.goNamed(HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 50,
          children: [
            Image.asset(
              'assets/images/background.png',
              width: 300,
            ),
            FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (
                BuildContext context,
                AsyncSnapshot<PackageInfo> snapshot,
              ) {
                if (snapshot.hasData) {
                  return Text(
                    S.of(context)!.version(snapshot.data!.version),
                    style: Theme.of(context).textTheme.displayLarge,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
