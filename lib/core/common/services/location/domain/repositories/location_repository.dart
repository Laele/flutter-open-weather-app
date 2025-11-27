import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/common/services/location/domain/entities/user_location_entity.dart';
import 'package:flutter_weather_app/core/error/failures.dart';

abstract interface class LocationRepository {
  Future<Either<Failure, UserLocation>> getLocation();
}
