import 'package:flutter_weather_app/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:flutter_weather_app/features/home/data/data_source/weather_remote_data_source.dart';
import 'package:flutter_weather_app/features/home/data/repositories/weather_repository_impl.dart';
import 'package:flutter_weather_app/features/home/domain/repositories/weather_repository.dart';
import 'package:flutter_weather_app/features/home/domain/usecases/get_current_weather_usecase.dart';
import 'package:flutter_weather_app/features/home/domain/usecases/get_hourly_weather_usecase.dart';
import 'package:flutter_weather_app/features/home/presentation/current_weather_bloc/current_weather_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_weather_app/features/home/presentation/hourly_weather_bloc/hourly_weather_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initTheme();
  _initWeather();

  final dioClient = Dio();
  serviceLocator.registerLazySingleton<Dio>(() => dioClient);
}

void _initTheme() {
  serviceLocator.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
}

void _initWeather() {
  serviceLocator
    ..registerFactory<WeatherRemoteDataSource>(() => WeatherRemoteDataSourceImpl(dioClient: serviceLocator()))
    ..registerFactory<WeatherRepository>(() => (WeatherRepositoryImpl(weatherRemoteDataSource: serviceLocator())))
    // Use Cases
    ..registerFactory<GetCurrentWeatherUseCase>(() => GetCurrentWeatherUseCase(weatherRepository: serviceLocator()))
    ..registerFactory(() => GetHourlyWeatherUseCase(weatherRepository: serviceLocator()))
    // bLoc
    ..registerFactory(() => CurrentWeatherBloc(getCurrentWeatherUseCase: serviceLocator()))
    ..registerFactory(() => HourlyWeatherBloc(getHourlyWeatherUseCase: serviceLocator()));
}
