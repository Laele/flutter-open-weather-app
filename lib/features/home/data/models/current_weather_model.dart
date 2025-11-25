import 'package:flutter_weather_app/core/common/utils/set_current_date.dart';
import 'package:flutter_weather_app/features/home/data/models/coord_model.dart';
import 'package:flutter_weather_app/features/home/data/models/main_temp_model.dart';
import 'package:flutter_weather_app/features/home/data/models/main_weather_model.dart';
import 'package:flutter_weather_app/features/home/domain/entities/current_weather_entity.dart';

class CurrentWeatherModel extends CurrentWeatherEntity {
  CurrentWeatherModel({
    required super.mainWeather,
    required super.coord,
    required super.mainTemp,
    required super.country,
    required super.city,
    required super.dt,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> map) {
    return CurrentWeatherModel(
      mainWeather: MainWeatherModel.fromJson(map['weather'][0]),
      mainTemp: MainTempModel.fromJson(map['main']),
      coord: CoordModel.fromJson(map['coord']),
      dt: SetCurrentDate(),
      country: map['sys']['country'] ?? '',
      city: map['name'] ?? '',
    );
  }
}
