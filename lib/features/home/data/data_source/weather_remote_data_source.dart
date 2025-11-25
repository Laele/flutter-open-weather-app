import 'package:dio/dio.dart';
import 'package:flutter_weather_app/features/home/data/models/current_weather_model.dart';
import 'package:flutter_weather_app/features/home/data/models/hourly_weather_model.dart';
import 'package:flutter_weather_app/secrets.dart';

abstract interface class WeatherRemoteDataSource {
  Future<CurrentWeatherModel> getCurrentWeather();
  Future<List<HourlyWeatherModel>> getHourlyWeather();
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio dioClient;
  WeatherRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<CurrentWeatherModel> getCurrentWeather() async {
    try {
      final response = await dioClient.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {'lat': '20.57196', 'lon': '-101.19154', 'units': 'metric', 'appid': Secrets.openWeatherApiKey},
      );
      return CurrentWeatherModel.fromJson(response.data);
    } catch (e) {
      throw 'error';
    }
  }

  @override
  Future<List<HourlyWeatherModel>> getHourlyWeather() async {
    try {
      final response = await dioClient.get(
        'https://api.openweathermap.org/data/2.5/forecast',
        queryParameters: {'lat': '20.57196', 'lon': '-101.19154', 'units': 'metric', 'appid': Secrets.openWeatherApiKey},
      );
      return (response.data['list'] as List<dynamic>).map((i) => HourlyWeatherModel.fromJson(i)).toList();
    } catch (e) {
      throw 'error';
    }
  }
}
