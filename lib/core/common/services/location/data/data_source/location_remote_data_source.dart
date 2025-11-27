import 'package:flutter_weather_app/core/common/services/location/domain/entities/user_location_entity.dart';
import 'package:geolocator/geolocator.dart';

abstract interface class LocationRemoteDataSource {
  Future<UserLocation> getLocation();
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  @override
  Future<UserLocation> getLocation() async {
    try {
      bool servicesEnabled = await Geolocator.isLocationServiceEnabled();
      if (!servicesEnabled) {
        throw Exception("Location services are disabled");
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      /*if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        throw Exception("Permision denied");
      }*/

      final position = await Geolocator.getCurrentPosition();
      print('${position.latitude} ${position.longitude}');
      return UserLocation(latitude: position.latitude, longitude: position.longitude);
    } on Exception catch (e) {
      throw 'error';
    }
  }
}
