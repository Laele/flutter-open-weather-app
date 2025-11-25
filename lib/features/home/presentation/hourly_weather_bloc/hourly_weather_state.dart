part of 'hourly_weather_bloc.dart';

@immutable
sealed class HourlyWeatherState {}

final class HourlyWeatherInitial extends HourlyWeatherState {}

final class HourlyWeatherLoading extends HourlyWeatherState {}

final class HourlyWeatherFailure extends HourlyWeatherState {
  final String message;
  HourlyWeatherFailure({required this.message});
}

final class HourlyWeatherSuccess extends HourlyWeatherState {
  final List<HourlyWeatherEntity> hourlyWeather;
  HourlyWeatherSuccess({required this.hourlyWeather});
}
