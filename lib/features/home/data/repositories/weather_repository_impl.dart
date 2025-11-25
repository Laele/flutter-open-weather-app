import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/error/failures.dart';
import 'package:flutter_weather_app/features/home/data/data_source/weather_remote_data_source.dart';
import 'package:flutter_weather_app/features/home/domain/entities/current_weather_entity.dart';
import 'package:flutter_weather_app/features/home/domain/entities/hourly_weather_entity.dart';
import 'package:flutter_weather_app/features/home/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  WeatherRepositoryImpl({required this.weatherRemoteDataSource});

  @override
  Future<Either<Failure, CurrentWeatherEntity>> getCurrentWeather() async {
    try {
      final currentWeather = await weatherRemoteDataSource.getCurrentWeather();
      return right(currentWeather);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HourlyWeatherEntity>>> getHourlyWeather() async {
    try {
      final hourlyWeatherList = await weatherRemoteDataSource.getHourlyWeather();
      return right(hourlyWeatherList);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
