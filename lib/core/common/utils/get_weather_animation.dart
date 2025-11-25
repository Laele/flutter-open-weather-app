import 'package:flutter_weather_app/core/common/constants/weather_codes.dart';

String getWeatherAsset(String code) {
  return Const.weatherCodes[code] ?? 'lib/core/assets/weather_lottie/clear_sky_d.json';
}
