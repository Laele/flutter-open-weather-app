import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_weather_app/core/theme/app_pallete.dart';
import 'package:flutter_weather_app/core/theme/app_text_theme_extensions.dart';

class WeatherInfoContainer extends StatelessWidget {
  final String tempFeelLike;
  final String humidty;
  final String pressure;

  const WeatherInfoContainer({super.key, required this.tempFeelLike, required this.humidty, required this.pressure});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).extension<AppPallete>()!.primaryContainerColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [BoxShadow(color: Theme.of(context).extension<AppPallete>()!.primaryBoxShadowContainerColor!, blurRadius: 12, offset: Offset(0, 10))],
        ),
        constraints: BoxConstraints(maxWidth: 600),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: WeatherInfoColumn(
                  icon: Icon(Icons.thermostat, color: Colors.red),
                  textValue: '$tempFeelLike°',
                  titleText: 'Feel Like',
                ),
              ),
              VerticalDivider(),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: WeatherInfoColumn(
                  icon: Icon(Icons.grain, color: Colors.blue),
                  textValue: '$humidty %',
                  titleText: 'Humidity',
                ),
              ),
              VerticalDivider(),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: WeatherInfoColumn(
                  icon: Icon(Icons.speed, color: Colors.grey),
                  textValue: '$pressure hPa',
                  titleText: 'Pressure',
                ),
              ),
            ],
          ),
        ),
      ).animate().fade(delay: Duration(milliseconds: 300)),
    );
  }
}

class WeatherInfoColumn extends StatelessWidget {
  final Icon icon;
  final String textValue;
  final String titleText;
  const WeatherInfoColumn({super.key, required this.icon, required this.textValue, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        Text(textValue, style: Theme.of(context).textTheme.titleLargeBold(context), maxLines: 1, overflow: TextOverflow.ellipsis),
        Text(
          titleText,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).extension<AppPallete>()!.primaryTextColor!.withAlpha(150)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
