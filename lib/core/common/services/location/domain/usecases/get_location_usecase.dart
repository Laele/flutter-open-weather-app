import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app/core/common/services/location/domain/entities/user_location_entity.dart';
import 'package:flutter_weather_app/core/common/services/location/domain/repositories/location_repository.dart';
import 'package:flutter_weather_app/core/error/failures.dart';
import 'package:flutter_weather_app/core/usecase/usecase.dart';

class GetLocationUseCase implements UseCase<UserLocation, NoParams> {
  final LocationRepository locationRepository;
  GetLocationUseCase({required this.locationRepository});

  @override
  Future<Either<Failure, UserLocation>> call(NoParams params) async {
    return await locationRepository.getLocation();
  }
}
