import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/common/services/location/data/data_source/location_remote_data_source.dart';
import 'package:flutter_weather_app/core/common/services/location/domain/entities/user_location_entity.dart';
import 'package:flutter_weather_app/core/common/services/location/domain/repositories/location_repository.dart';
import 'package:flutter_weather_app/core/error/failures.dart';
import 'package:flutter_weather_app/core/error/exceptions/location_exceptions.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource locationRemoteDataSource;
  LocationRepositoryImpl({required this.locationRemoteDataSource});

  @override
  Future<Either<Failure, UserLocation>> getLocation() async {
    try {
      final UserLocation userLocation = await locationRemoteDataSource.getLocation();
      return right(userLocation);
    } on LocationException catch (_) {
      return left(LocationFailure());
    } catch (e) {
      return left(LocationUnkwnownFailure());
    }
  }
}
