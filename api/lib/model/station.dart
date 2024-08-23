//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Station {
  /// Returns a new [Station] instance.
  Station({
    this.id,
    required this.name,
    this.latitude,
    this.longitude,
    this.cityId,
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

  String name;

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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? cityId;

  List<Measurement>? measurements;

  List<Forecast>? forecasts;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Station &&
    other.id == id &&
    other.name == name &&
    other.latitude == latitude &&
    other.longitude == longitude &&
    other.cityId == cityId &&
    _deepEquality.equals(other.measurements, measurements) &&
    _deepEquality.equals(other.forecasts, forecasts);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (name.hashCode) +
    (latitude == null ? 0 : latitude!.hashCode) +
    (longitude == null ? 0 : longitude!.hashCode) +
    (cityId == null ? 0 : cityId!.hashCode) +
    (measurements == null ? 0 : measurements!.hashCode) +
    (forecasts == null ? 0 : forecasts!.hashCode);

  @override
  String toString() => 'Station[id=$id, name=$name, latitude=$latitude, longitude=$longitude, cityId=$cityId, measurements=$measurements, forecasts=$forecasts]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'name'] = this.name;
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
    if (this.cityId != null) {
      json[r'cityId'] = this.cityId;
    } else {
      json[r'cityId'] = null;
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

  /// Returns a new [Station] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Station? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Station[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Station[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Station(
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name')!,
        latitude: mapValueOfType<double>(json, r'latitude'),
        longitude: mapValueOfType<double>(json, r'longitude'),
        cityId: mapValueOfType<int>(json, r'cityId'),
        measurements: Measurement.listFromJson(json[r'measurements']),
        forecasts: Forecast.listFromJson(json[r'forecasts']),
      );
    }
    return null;
  }

  static List<Station> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Station>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Station.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Station> mapFromJson(dynamic json) {
    final map = <String, Station>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Station.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Station-objects as value to a dart map
  static Map<String, List<Station>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Station>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Station.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

