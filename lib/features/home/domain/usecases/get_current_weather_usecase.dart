import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/error/failures.dart';
import 'package:flutter_weather_app/core/usecase/usecase.dart';
import 'package:flutter_weather_app/features/home/domain/entities/current_weather_entity.dart';
import 'package:flutter_weather_app/features/home/domain/repositories/weather_repository.dart';

class GetCurrentWeatherUseCase implements UseCase<CurrentWeatherEntity, NoParams> {
  final WeatherRepository weatherRepository;
  const GetCurrentWeatherUseCase({required this.weatherRepository});

  @override
  Future<Either<Failure, CurrentWeatherEntity>> call(NoParams params) async {
    return await weatherRepository.getCurrentWeather();
  }
}
