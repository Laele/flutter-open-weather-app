import 'package:flutter_weather_app/features/home/domain/entities/main_temp_entity.dart';

class MainTempModel extends MainTempEntity {
  MainTempModel({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.seaLevel,
    required super.grindLevel,
    required super.humidity,
    required super.tempKf,
  });

  factory MainTempModel.fromJson(Map<String, dynamic> map) {
    return MainTempModel(
      temp: map['temp']?.toDouble() ?? 0.0,
      feelsLike: map['feels_like']?.toDouble() ?? 0.0,
      tempMin: map['temp_min']?.toDouble() ?? 0.0,
      tempMax: map['temp_max']?.toDouble() ?? 0.0,
      pressure: map['pressure'] ?? 0,
      seaLevel: map['sea_level'] ?? 0,
      grindLevel: map['grnd_level'] ?? 0,
      humidity: map['humidity'] ?? 0,
      tempKf: map['temp_kf']?.toDouble() ?? 0.0,
    );
  }
}
