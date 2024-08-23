//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ForecastDto {
  /// Returns a new [ForecastDto] instance.
  ForecastDto({
    this.forecastTime,
    this.co,
    this.pM25,
    this.pM10,
    this.sO2,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? forecastTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? co;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? pM25;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? pM10;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? sO2;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ForecastDto &&
    other.forecastTime == forecastTime &&
    other.co == co &&
    other.pM25 == pM25 &&
    other.pM10 == pM10 &&
    other.sO2 == sO2;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (forecastTime == null ? 0 : forecastTime!.hashCode) +
    (co == null ? 0 : co!.hashCode) +
    (pM25 == null ? 0 : pM25!.hashCode) +
    (pM10 == null ? 0 : pM10!.hashCode) +
    (sO2 == null ? 0 : sO2!.hashCode);

  @override
  String toString() => 'ForecastDto[forecastTime=$forecastTime, co=$co, pM25=$pM25, pM10=$pM10, sO2=$sO2]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.forecastTime != null) {
      json[r'forecastTime'] = this.forecastTime!.toUtc().toIso8601String();
    } else {
      json[r'forecastTime'] = null;
    }
    if (this.co != null) {
      json[r'co'] = this.co;
    } else {
      json[r'co'] = null;
    }
    if (this.pM25 != null) {
      json[r'pM2_5'] = this.pM25;
    } else {
      json[r'pM2_5'] = null;
    }
    if (this.pM10 != null) {
      json[r'pM10'] = this.pM10;
    } else {
      json[r'pM10'] = null;
    }
    if (this.sO2 != null) {
      json[r'sO2'] = this.sO2;
    } else {
      json[r'sO2'] = null;
    }
    return json;
  }

  /// Returns a new [ForecastDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ForecastDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ForecastDto[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ForecastDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ForecastDto(
        forecastTime: mapDateTime(json, r'forecastTime', r''),
        co: mapValueOfType<double>(json, r'co'),
        pM25: mapValueOfType<double>(json, r'pM2_5'),
        pM10: mapValueOfType<double>(json, r'pM10'),
        sO2: mapValueOfType<double>(json, r'sO2'),
      );
    }
    return null;
  }

  static List<ForecastDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ForecastDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ForecastDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ForecastDto> mapFromJson(dynamic json) {
    final map = <String, ForecastDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ForecastDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ForecastDto-objects as value to a dart map
  static Map<String, List<ForecastDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ForecastDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ForecastDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

