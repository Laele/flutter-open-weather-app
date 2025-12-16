abstract class LocationException implements Exception {
  final String message;
  const LocationException([this.message = '']);
}

final class LocationPermissionDeniedException extends LocationException {
  const LocationPermissionDeniedException([super.message = 'Location Permission Denied.']);
}

final class LocationPermissionDeniedForeverException extends LocationException {
  const LocationPermissionDeniedForeverException([super.message = 'Location Permission Denied Forever.']);
}

final class ServiceLocationDisabledException extends LocationException {
  const ServiceLocationDisabledException([super.message = 'Location services are disabled.']);
}

final class LocationUnknownException extends LocationException {
  const LocationUnknownException([super.message = 'Unknown location error']);
}
