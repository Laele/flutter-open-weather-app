import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/common/services/location/domain/entities/user_location_entity.dart';
import 'package:flutter_weather_app/core/error/failures.dart';
import 'package:flutter_weather_app/core/usecase/usecase.dart';
import 'package:flutter_weather_app/features/home/domain/entities/hourly_weather_entity.dart';
import 'package:flutter_weather_app/features/home/domain/repositories/weather_repository.dart';

class GetHourlyWeatherUseCase implements UseCase<List<HourlyWeatherEntity>, UserLocation> {
  final WeatherRepository weatherRepository;
  GetHourlyWeatherUseCase({required this.weatherRepository});

  @override
  Future<Either<Failure, List<HourlyWeatherEntity>>> call(UserLocation params) async {
    return weatherRepository.getHourlyWeather(location: params);
  }
}
