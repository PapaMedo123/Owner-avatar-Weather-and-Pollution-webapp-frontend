import 'package:geolocator/geolocator.dart';

class LocationService {
  static final LocationService _instance = LocationService._();
  static const LocationSettings _locationSettings = LocationSettings(
    accuracy: LocationAccuracy.low,
    distanceFilter: 1000,
  );
  static const String _kLocationServicesDisabledMessage =
      'Location services are disabled.';
  static const String _kPermissionDeniedMessage = 'Permission denied.';
  static const String _kPermissionDeniedForeverMessage =
      'Permission denied forever.';
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  factory LocationService() {
    return _instance;
  }

  LocationService._();

  Future<Position> getCurrentPosition() async {
    final String? hasPermission = await _handlePermission();

    if (hasPermission != null) {
      throw Exception(hasPermission);
    }

    final position = await _geolocatorPlatform.getCurrentPosition(
        locationSettings: _locationSettings);
    return position;
  }

  Future<String?> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return _kLocationServicesDisabledMessage;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return _kPermissionDeniedMessage;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return _kPermissionDeniedForeverMessage;
    }
    return null;
  }
}
