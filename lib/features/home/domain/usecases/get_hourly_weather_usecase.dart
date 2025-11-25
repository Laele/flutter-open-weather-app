import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/error/failures.dart';
import 'package:flutter_weather_app/core/usecase/usecase.dart';
import 'package:flutter_weather_app/features/home/domain/entities/hourly_weather_entity.dart';
import 'package:flutter_weather_app/features/home/domain/repositories/weather_repository.dart';

class GetHourlyWeatherUseCase implements UseCase<List<HourlyWeatherEntity>, NoParams> {
  final WeatherRepository weatherRepository;
  GetHourlyWeatherUseCase({required this.weatherRepository});

  @override
  Future<Either<Failure, List<HourlyWeatherEntity>>> call(NoParams params) async {
    return weatherRepository.getHourlyWeather();
  }
}
