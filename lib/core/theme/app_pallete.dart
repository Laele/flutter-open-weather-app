import 'package:flutter/material.dart';

final class AppPallete extends ThemeExtension<AppPallete> {
  final Color? scaffoldBackgroundColor;
  final Color? primaryContainerColor;
  final Color? primaryTextColor;
  final Color? primaryBoxShadowContainerColor;

  const AppPallete({this.scaffoldBackgroundColor, this.primaryTextColor, this.primaryContainerColor, this.primaryBoxShadowContainerColor});

  @override
  ThemeExtension<AppPallete> copyWith({
    Color? scaffoldBackgroundColor,
    Color? primaryTextColor,
    Color? primaryContainerColor,
    Color? primaryBoxShadowContainerColor,
  }) {
    return AppPallete(
      scaffoldBackgroundColor: scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      primaryContainerColor: primaryContainerColor ?? this.primaryContainerColor,
      primaryBoxShadowContainerColor: primaryBoxShadowContainerColor ?? this.primaryBoxShadowContainerColor,
    );
  }

  @override
  ThemeExtension<AppPallete> lerp(covariant ThemeExtension<AppPallete>? other, double t) {
    if (other is! AppPallete) return this;
    return AppPallete(
      scaffoldBackgroundColor: Color.lerp(scaffoldBackgroundColor, other.scaffoldBackgroundColor, t),
      primaryTextColor: Color.lerp(primaryTextColor, other.primaryTextColor, t),
      primaryContainerColor: Color.lerp(primaryContainerColor, other.primaryContainerColor, t),
      primaryBoxShadowContainerColor: Color.lerp(primaryBoxShadowContainerColor, other.primaryBoxShadowContainerColor, t),
    );
  }
}

class Palettes {
  static AppPallete light = AppPallete(
    scaffoldBackgroundColor: Color.fromARGB(255, 227, 240, 253),
    primaryTextColor: Color.fromARGB(255, 10, 68, 175),
    primaryContainerColor: Colors.white,
    primaryBoxShadowContainerColor: Colors.black.withAlpha(70),
  );
  static AppPallete dark = AppPallete(
    scaffoldBackgroundColor: null,
    primaryTextColor: Colors.white,
    primaryContainerColor: Color.fromARGB(255, 40, 40, 40),
    primaryBoxShadowContainerColor: Colors.black.withAlpha(90),
  );
}
