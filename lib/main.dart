import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:van_dog/config/dependency_injection/di.dart';
import 'package:van_dog/config/env/app_environment.dart';
import 'package:van_dog/config/router/app_router.dart';

import 'package:van_dog/config/theme/app_color_theme.dart';
import 'package:van_dog/features/breeds/presentation/provider/breeds_provider.dart';
import 'package:van_dog/features/internationalization/domain/localization_delegates.dart';
import 'package:van_dog/features/internationalization/domain/supported_locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppEnvironment.setUp();
  getItSetup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => getIt.get<BreedsProvider>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        darkTheme: appDarkTheme,
        localizationsDelegates: localizationDelegates,
        supportedLocales: supportedLocales,
        routerConfig: appRouter,
      ),
    );
  }
}
