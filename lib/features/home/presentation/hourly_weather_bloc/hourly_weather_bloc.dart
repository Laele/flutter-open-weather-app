import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_weather_app/core/usecase/usecase.dart';
import 'package:flutter_weather_app/features/home/domain/entities/hourly_weather_entity.dart';
import 'package:flutter_weather_app/features/home/domain/usecases/get_hourly_weather_usecase.dart';
import 'package:meta/meta.dart';

part 'hourly_weather_event.dart';
part 'hourly_weather_state.dart';

class HourlyWeatherBloc extends Bloc<HourlyWeatherEvent, HourlyWeatherState> {
  final GetHourlyWeatherUseCase _getHourlyWeatherUseCase;

  HourlyWeatherBloc({required GetHourlyWeatherUseCase getHourlyWeatherUseCase})
    : _getHourlyWeatherUseCase = getHourlyWeatherUseCase,
      super(HourlyWeatherInitial()) {
    on<GetHourlyWeather>(_onGetHourlyWeather);
  }

  FutureOr<void> _onGetHourlyWeather(GetHourlyWeather event, Emitter<HourlyWeatherState> emit) async {
    await Future.delayed(Duration(seconds: 5));
    emit(HourlyWeatherLoading());
    final response = await _getHourlyWeatherUseCase(NoParams());
    response.fold(
      (l) {
        emit(HourlyWeatherFailure(message: l.message));
      },
      (r) {
        emit(HourlyWeatherSuccess(hourlyWeather: r));
      },
    );
  }
}
