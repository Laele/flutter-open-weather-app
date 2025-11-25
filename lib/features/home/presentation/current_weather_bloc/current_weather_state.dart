part of 'current_weather_bloc.dart';

@immutable
sealed class CurrentWeatherState {}

final class CurrentWeatherInitial extends CurrentWeatherState {}

final class CurrentWeatherLoading extends CurrentWeatherState {}

final class CurrentWeatherFailure extends CurrentWeatherState {
  final String error;
  CurrentWeatherFailure({required this.error});
}

final class CurrentWeatherSuccess extends CurrentWeatherState {
  final CurrentWeatherEntity weather;
  CurrentWeatherSuccess({required this.weather});
}
