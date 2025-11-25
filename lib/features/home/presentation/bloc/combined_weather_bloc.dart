import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'combined_weather_event.dart';
part 'combined_weather_state.dart';

class CombinedWeatherBloc extends Bloc<CombinedWeatherEvent, CombinedWeatherState> {
  CombinedWeatherBloc(/*{required CurrentWeatherBloc currentWeatherBloc}*/) : super(CombinedWeatherInitial()) {
    on<CombinedWeatherEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
