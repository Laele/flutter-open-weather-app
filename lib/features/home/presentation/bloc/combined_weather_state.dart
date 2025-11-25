part of 'combined_weather_bloc.dart';

sealed class CombinedWeatherState extends Equatable {
  const CombinedWeatherState();
  
  @override
  List<Object> get props => [];
}

final class CombinedWeatherInitial extends CombinedWeatherState {}
