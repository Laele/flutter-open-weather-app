import 'package:flutter_weather_app/core/common/utils/format_date.dart';
import 'package:flutter_weather_app/features/home/data/models/main_temp_model.dart';
import 'package:flutter_weather_app/features/home/data/models/main_weather_model.dart';
import 'package:flutter_weather_app/features/home/domain/entities/hourly_weather_entity.dart';

class HourlyWeatherModel extends HourlyWeatherEntity {
  HourlyWeatherModel({required super.dt, required super.hour, required super.weatherList, required super.mainTemp});

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> map) {
    return HourlyWeatherModel(
      dt: formatDateByUnixTimeToYMMMD(map['dt']),
      hour: formatDateByUnixTimeToHoursMinutes(map['dt']),
      weatherList: (map['weather'] as List<dynamic>).map((i) => MainWeatherModel.fromJson(i)).toList() ?? [],
      mainTemp: MainTempModel.fromJson(map['main']),
    );
  }
}
