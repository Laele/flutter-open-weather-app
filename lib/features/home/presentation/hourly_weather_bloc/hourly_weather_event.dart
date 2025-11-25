part of 'hourly_weather_bloc.dart';

@immutable
sealed class HourlyWeatherEvent {}

final class GetHourlyWeather extends HourlyWeatherEvent {}
