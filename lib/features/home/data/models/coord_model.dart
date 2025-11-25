import 'package:flutter_weather_app/features/home/domain/entities/coord_entity.dart';

class CoordModel extends CoordEntity {
  CoordModel({required super.lat, required super.lon});

  factory CoordModel.fromJson(Map<String, dynamic> map) {
    return CoordModel(lat: map['lat'] ?? 0.0, lon: map['lon'] ?? 0.0);
  }
}
