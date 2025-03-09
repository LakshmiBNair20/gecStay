import 'package:freezed_annotation/freezed_annotation.dart';
part 'location_fetch_failures.freezed.dart';

@freezed
abstract class LocationFetchFailures with _$LocationFetchFailures {
  const factory LocationFetchFailures.locationServiceDisabled() =
      _locationServiceDisabled;
      const factory LocationFetchFailures.LocationPermissionDenied() = _LocationPermissionDenied;
      const factory LocationFetchFailures.networkError() = _networkError;
      
}
