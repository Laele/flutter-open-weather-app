import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_weather_app/core/usecase/usecase.dart';
import 'package:meta/meta.dart';
import 'package:flutter_weather_app/features/home/domain/entities/current_weather_entity.dart';
import 'package:flutter_weather_app/features/home/domain/usecases/get_current_weather_usecase.dart';

part 'current_weather_event.dart';
part 'current_weather_state.dart';

class CurrentWeatherBloc extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  CurrentWeatherBloc({required GetCurrentWeatherUseCase getCurrentWeatherUseCase})
    : _getCurrentWeatherUseCase = getCurrentWeatherUseCase,
      super(CurrentWeatherInitial()) {
    /*on<WeatherEvent>((event, emit) {
      // TODO: implement event handler
      return emit(WeatherInitial());
    });*/

    on<GetCurrentWeather>(_onGetCurrentWeather);
  }

  FutureOr<void> _onGetCurrentWeather(GetCurrentWeather event, Emitter<CurrentWeatherState> emit) async {
    emit(CurrentWeatherLoading());
    await Future.delayed(Duration(seconds: 5));
    final currentWeatherRes = await _getCurrentWeatherUseCase(NoParams());
    currentWeatherRes.fold(
      (l) {
        emit(CurrentWeatherFailure(error: l.message));
      },
      (r) {
        emit(CurrentWeatherSuccess(weather: r));
      },
    );
  }
}
