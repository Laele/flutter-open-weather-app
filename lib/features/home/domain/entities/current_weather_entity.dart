import 'package:flutter_weather_app/features/home/domain/entities/coord_entity.dart';
import 'package:flutter_weather_app/features/home/domain/entities/main_temp_entity.dart';
import 'package:flutter_weather_app/features/home/domain/entities/main_weather_entity.dart';

class CurrentWeatherEntity {
  final String dt;
  final MainTempEntity mainTemp;
  final CoordEntity coord;
  final MainWeatherEntity mainWeather;
  final String city;
  final String country;

  CurrentWeatherEntity({required this.coord, required this.mainWeather, required this.dt, required this.country, required this.city, required this.mainTemp});
}
