import 'package:flutter_weather_app/features/home/domain/entities/main_weather_entity.dart';

class MainWeatherModel extends MainWeatherEntity {
  MainWeatherModel({required super.id, required super.main, required super.description, required super.icon});

  factory MainWeatherModel.fromJson(Map<String, dynamic> map) {
    return MainWeatherModel(id: map['id'] ?? 0, main: map['main'] ?? '', description: map['description'] ?? '', icon: map['icon'] ?? '');
  }
}
