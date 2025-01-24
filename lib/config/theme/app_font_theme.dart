import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFontsConstants {
  static final displayLarge = GoogleFonts.pacifico();
  static final displayMedium = GoogleFonts.pacifico();
  static final displaySmall = GoogleFonts.pacifico();
}

TextTheme appFontTheme = GoogleFonts.openSansTextTheme().copyWith(
  displayLarge: AppFontsConstants.displayLarge,
  displayMedium: AppFontsConstants.displayMedium,
  displaySmall: AppFontsConstants.displaySmall,
);
