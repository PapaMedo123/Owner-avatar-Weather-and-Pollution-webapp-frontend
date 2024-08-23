//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StationDto {
  /// Returns a new [StationDto] instance.
  StationDto({
    this.id,
    this.cityName,
    this.stationName,
    this.latitude,
    this.longitude,
    this.measurements = const [],
    this.forecasts = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  String? cityName;

  String? stationName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? latitude;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? longitude;

  List<MeasurementDto>? measurements;

  List<ForecastDto>? forecasts;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StationDto &&
    other.id == id &&
    other.cityName == cityName &&
    other.stationName == stationName &&
    other.latitude == latitude &&
    other.longitude == longitude &&
    _deepEquality.equals(other.measurements, measurements) &&
    _deepEquality.equals(other.forecasts, forecasts);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (cityName == null ? 0 : cityName!.hashCode) +
    (stationName == null ? 0 : stationName!.hashCode) +
    (latitude == null ? 0 : latitude!.hashCode) +
    (longitude == null ? 0 : longitude!.hashCode) +
    (measurements == null ? 0 : measurements!.hashCode) +
    (forecasts == null ? 0 : forecasts!.hashCode);

  @override
  String toString() => 'StationDto[id=$id, cityName=$cityName, stationName=$stationName, latitude=$latitude, longitude=$longitude, measurements=$measurements, forecasts=$forecasts]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.cityName != null) {
      json[r'cityName'] = this.cityName;
    } else {
      json[r'cityName'] = null;
    }
    if (this.stationName != null) {
      json[r'stationName'] = this.stationName;
    } else {
      json[r'stationName'] = null;
    }
    if (this.latitude != null) {
      json[r'latitude'] = this.latitude;
    } else {
      json[r'latitude'] = null;
    }
    if (this.longitude != null) {
      json[r'longitude'] = this.longitude;
    } else {
      json[r'longitude'] = null;
    }
    if (this.measurements != null) {
      json[r'measurements'] = this.measurements;
    } else {
      json[r'measurements'] = null;
    }
    if (this.forecasts != null) {
      json[r'forecasts'] = this.forecasts;
    } else {
      json[r'forecasts'] = null;
    }
    return json;
  }

  /// Returns a new [StationDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StationDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StationDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StationDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StationDto(
        id: mapValueOfType<int>(json, r'id'),
        cityName: mapValueOfType<String>(json, r'cityName'),
        stationName: mapValueOfType<String>(json, r'stationName'),
        latitude: mapValueOfType<double>(json, r'latitude'),
        longitude: mapValueOfType<double>(json, r'longitude'),
        measurements: MeasurementDto.listFromJson(json[r'measurements']),
        forecasts: ForecastDto.listFromJson(json[r'forecasts']),
      );
    }
    return null;
  }

  static List<StationDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StationDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StationDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StationDto> mapFromJson(dynamic json) {
    final map = <String, StationDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StationDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StationDto-objects as value to a dart map
  static Map<String, List<StationDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StationDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StationDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

