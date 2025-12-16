import 'package:flutter_weather_app/core/common/services/location/domain/entities/user_location_entity.dart';
import 'package:flutter_weather_app/core/error/exceptions/location_exceptions.dart';
import 'package:geolocator/geolocator.dart';

abstract interface class LocationRemoteDataSource {
  Future<UserLocation> getLocation();
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  @override
  Future<UserLocation> getLocation() async {
    try {
      await _handleLocationPermission();

      final position = await Geolocator.getCurrentPosition();
      return UserLocation(latitude: position.latitude, longitude: position.longitude);
    } on LocationException catch (_) {
      rethrow;
    } on Exception catch (e) {
      throw LocationUnknownException(e.toString());
    }
  }

  Future<void> _handleLocationPermission() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw ServiceLocationDisabledException();
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw LocationPermissionDeniedException();
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationPermissionDeniedForeverException();
    }
  }
}
