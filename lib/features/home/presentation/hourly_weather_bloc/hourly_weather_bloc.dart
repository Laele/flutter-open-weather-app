import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_weather_app/core/common/services/location/domain/entities/user_location_entity.dart';
import 'package:flutter_weather_app/core/common/services/location/domain/usecases/get_location_usecase.dart';
import 'package:flutter_weather_app/core/usecase/usecase.dart';
import 'package:flutter_weather_app/features/home/domain/entities/hourly_weather_entity.dart';
import 'package:flutter_weather_app/features/home/domain/usecases/get_hourly_weather_usecase.dart';
import 'package:meta/meta.dart';

part 'hourly_weather_event.dart';
part 'hourly_weather_state.dart';

class HourlyWeatherBloc extends Bloc<HourlyWeatherEvent, HourlyWeatherState> {
  final GetHourlyWeatherUseCase _getHourlyWeatherUseCase;
  final GetLocationUseCase _getLocationUseCase;

  HourlyWeatherBloc({required GetHourlyWeatherUseCase getHourlyWeatherUseCase, required GetLocationUseCase getLocationUseCase})
    : _getHourlyWeatherUseCase = getHourlyWeatherUseCase,
      _getLocationUseCase = getLocationUseCase,
      super(HourlyWeatherInitial()) {
    on<GetHourlyWeather>(_onGetHourlyWeather);
  }

  FutureOr<void> _onGetHourlyWeather(GetHourlyWeather event, Emitter<HourlyWeatherState> emit) async {
    emit(HourlyWeatherLoading());
    await Future.delayed(Duration(seconds: 5));

    final location = await _getLocationUseCase(NoParams());

    if (location.isLeft()) {
      emit(HourlyWeatherFailure(message: location.getOrElse(() => throw Exception()).toString()));
      return;
    }

    final locationResponse = location.getOrElse(() => throw Exception());

    final currentWeatherRes = await _getHourlyWeatherUseCase(UserLocation(latitude: locationResponse.latitude, longitude: locationResponse.longitude));
    currentWeatherRes.fold(
      (l) {
        emit(HourlyWeatherFailure(message: l.message));
      },
      (r) {
        emit(HourlyWeatherSuccess(hourlyWeather: r));
      },
    );
  }
}
