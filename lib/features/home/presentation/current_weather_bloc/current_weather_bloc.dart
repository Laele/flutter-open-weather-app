import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_weather_app/core/common/services/location/domain/entities/user_location_entity.dart';
import 'package:flutter_weather_app/core/common/services/location/domain/usecases/get_location_usecase.dart';
import 'package:flutter_weather_app/core/usecase/usecase.dart';
import 'package:meta/meta.dart';
import 'package:flutter_weather_app/features/home/domain/entities/current_weather_entity.dart';
import 'package:flutter_weather_app/features/home/domain/usecases/get_current_weather_usecase.dart';

part 'current_weather_event.dart';
part 'current_weather_state.dart';

class CurrentWeatherBloc extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;
  final GetLocationUseCase _getLocationUseCase;

  CurrentWeatherBloc({required GetCurrentWeatherUseCase getCurrentWeatherUseCase, required GetLocationUseCase getLocationUseCase})
    : _getCurrentWeatherUseCase = getCurrentWeatherUseCase,
      _getLocationUseCase = getLocationUseCase,
      super(CurrentWeatherInitial()) {
    /*on<WeatherEvent>((event, emit) {
      // TODO: implement event handler
      return emit(WeatherInitial());
    });*/

    on<GetCurrentWeather>(_onGetCurrentWeather);
    on<GetCurrentWeatherWithLocation>(_onCurrentWeatherWithLocation);
  }

  FutureOr<void> _onGetCurrentWeather(GetCurrentWeather event, Emitter<CurrentWeatherState> emit) async {
    emit(CurrentWeatherLoading());
    await Future.delayed(Duration(seconds: 5));

    final location = await _getLocationUseCase(NoParams());

    if (location.isLeft()) {
      emit(CurrentWeatherFailure(error: location.getOrElse(() => throw Exception()).toString()));
      return;
    }

    final locationResponse = location.getOrElse(() => throw Exception());

    final currentWeatherRes = await _getCurrentWeatherUseCase(UserLocation(latitude: locationResponse.latitude, longitude: locationResponse.longitude));
    currentWeatherRes.fold(
      (l) {
        emit(CurrentWeatherFailure(error: l.message));
      },
      (r) {
        emit(CurrentWeatherSuccess(weather: r));
      },
    );
  }

  FutureOr<void> _onCurrentWeatherWithLocation(GetCurrentWeatherWithLocation event, Emitter<CurrentWeatherState> emit) async {
    emit(CurrentWeatherLoading());
    final currentWeatherWithLocationRes = await _getCurrentWeatherUseCase(UserLocation(latitude: event.latitude, longitude: event.longitude));
    currentWeatherWithLocationRes.fold(
      (l) {
        emit(CurrentWeatherFailure(error: l.message));
      },
      (r) {
        emit(CurrentWeatherSuccess(weather: r));
      },
    );
  }
}
