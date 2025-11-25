import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/theme/app_pallete.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light() {
    final palette = Palettes.light;
    return ThemeData.light().copyWith(
      colorScheme: ColorScheme.light(onSurface: palette.primaryTextColor!),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme).apply(bodyColor: palette.primaryTextColor),

      scaffoldBackgroundColor: palette.scaffoldBackgroundColor,
      extensions: [palette],
    );
  }

  static ThemeData dark() {
    final palette = Palettes.dark;
    return ThemeData.dark().copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).apply(),
      colorScheme: ColorScheme.dark().copyWith(onSurface: Colors.red),
      extensions: [palette],
    );
  }
}
