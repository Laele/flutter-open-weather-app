import 'package:dio/dio.dart';
import 'package:flutter_weather_app/core/error/exceptions.dart';

Exception mapDioException(DioException e) {
  // No Connection / DNS / Lost Netwrok
  if (e.type == DioExceptionType.connectionError || e.type == DioExceptionType.unknown) {
    return ConnectionException();
  }

  // Connection Timeout
  if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout) {
    return TimeoutException();
  }

  // Sever Error (500+)
  final status = e.response?.statusCode ?? 0;
  if (status >= 500) {
    return ServerException();
  }

  // Unknown Error
  return UnkwnownException();
}
