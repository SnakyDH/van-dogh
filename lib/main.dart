import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:van_dog/config/dependency_injection/di.dart';
import 'package:van_dog/config/env/app_environment.dart';
import 'package:van_dog/config/router/app_router.dart';

import 'package:van_dog/config/theme/app_color_theme.dart';
import 'package:van_dog/config/theme/app_font_theme.dart';
import 'package:van_dog/features/breeds/presentation/provider/breeds_provider.dart';

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
        ChangeNotifierProvider(create: (_) => getIt.get<BreedsProvider>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: appFontTheme,
          colorScheme: appLightColorTheme,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
        ),
        darkTheme: ThemeData(
          textTheme: appFontTheme,
          colorScheme: appDarkColorTheme,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale("es"),
        ],
        routerConfig: appRouter,
      ),
    );
  }
}
