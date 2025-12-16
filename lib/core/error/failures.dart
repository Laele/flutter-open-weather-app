abstract class Failure {
  final String message;
  const Failure([this.message = '']);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = "There was a problem with the server. Please try again later."]);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure([super.message = '''It seems you don't have an internet connection.''']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = "Cache Failure."]);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure([super.message = "The connection took too long. Please try again."]);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = "Unkwnow Failure."]);
}

// Location Failure
class LocationFailure extends Failure {
  const LocationFailure([super.message = 'There was a problem with the location services. Please verify and active location services.']);
}

class LocationUnkwnownFailure extends Failure {
  const LocationUnkwnownFailure([super.message = "There was a problem. Please try again later."]);
}
