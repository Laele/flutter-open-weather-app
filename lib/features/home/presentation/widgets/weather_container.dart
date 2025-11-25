import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/common/utils/get_weather_animation.dart';
import 'package:lottie/lottie.dart';

class WeatherContainer extends StatelessWidget {
  final String date;
  final String hour;
  final String temp;
  final String weatherIconCode;

  const WeatherContainer({super.key, required this.date, required this.hour, required this.temp, required this.weatherIconCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 120,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(color: Colors.white.withAlpha(50), borderRadius: BorderRadius.circular(24.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(date, style: Theme.of(context).textTheme.bodyMedium),
              Text(hour, style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),

          Container(
            width: double.infinity,

            //color: Colors.red,
            child: Lottie.asset(getWeatherAsset(weatherIconCode), fit: BoxFit.fitWidth),
          ),
          Text('$temp°c', style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
    );
  }
}
