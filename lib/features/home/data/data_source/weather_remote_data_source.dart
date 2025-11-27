import 'package:dio/dio.dart';
import 'package:flutter_weather_app/core/common/services/location/domain/entities/user_location_entity.dart';
import 'package:flutter_weather_app/features/home/data/models/current_weather_model.dart';
import 'package:flutter_weather_app/features/home/data/models/hourly_weather_model.dart';
import 'package:flutter_weather_app/secrets.dart';

abstract interface class WeatherRemoteDataSource {
  Future<CurrentWeatherModel> getCurrentWeather({required UserLocation location});
  Future<List<HourlyWeatherModel>> getHourlyWeather({required UserLocation location});
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio dioClient;
  WeatherRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<CurrentWeatherModel> getCurrentWeather({required UserLocation location}) async {
    try {
      final response = await dioClient.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {'lat': location.latitude, 'lon': location.longitude, 'units': 'metric', 'appid': Secrets.openWeatherApiKey},
      );
      return CurrentWeatherModel.fromJson(response.data);
    } catch (e) {
      throw 'error';
    }
  }

  @override
  Future<List<HourlyWeatherModel>> getHourlyWeather({required UserLocation location}) async {
    try {
      final response = await dioClient.get(
        'https://api.openweathermap.org/data/2.5/forecast',
        queryParameters: {'lat': location.latitude, 'lon': location.longitude, 'units': 'metric', 'appid': Secrets.openWeatherApiKey},
      );
      return (response.data['list'] as List<dynamic>).map((i) => HourlyWeatherModel.fromJson(i)).toList();
    } catch (e) {
      throw 'error';
    }
  }
}
