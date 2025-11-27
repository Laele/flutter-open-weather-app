part of 'current_weather_bloc.dart';

@immutable
sealed class CurrentWeatherEvent {}

final class GetCurrentWeather extends CurrentWeatherEvent {}

final class GetCurrentWeatherWithLocation extends CurrentWeatherEvent {
  final double latitude;
  final double longitude;
  GetCurrentWeatherWithLocation({required this.latitude, required this.longitude});
}
