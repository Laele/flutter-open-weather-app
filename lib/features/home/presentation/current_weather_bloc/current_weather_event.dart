part of 'current_weather_bloc.dart';

@immutable
sealed class CurrentWeatherEvent {}

final class GetCurrentWeather extends CurrentWeatherEvent {}
