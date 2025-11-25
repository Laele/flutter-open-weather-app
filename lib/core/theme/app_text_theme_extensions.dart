import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/theme/app_pallete.dart';

extension AppTextTheme on TextTheme {
  TextStyle titleLargeBold(BuildContext context) {
    final palette = Theme.of(context).extension<AppPallete>()!;
    return titleLarge!.copyWith(fontWeight: FontWeight.bold, color: palette.primaryTextColor);
  }

  TextStyle get bodyLargeFade => bodyLarge!.copyWith(fontWeight: FontWeight.bold, color: bodyLarge!.color!.withAlpha(100));
}
