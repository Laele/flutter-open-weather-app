import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/common/services/location/domain/entities/user_location_entity.dart';
import 'package:flutter_weather_app/core/error/failures.dart';
import 'package:flutter_weather_app/features/home/domain/entities/current_weather_entity.dart';
import 'package:flutter_weather_app/features/home/domain/entities/hourly_weather_entity.dart';

abstract interface class WeatherRepository {
  Future<Either<Failure, CurrentWeatherEntity>> getCurrentWeather({required UserLocation location});

  Future<Either<Failure, List<HourlyWeatherEntity>>> getHourlyWeather({required UserLocation location});
}
