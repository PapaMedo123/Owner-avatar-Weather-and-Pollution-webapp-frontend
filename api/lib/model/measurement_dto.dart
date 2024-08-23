//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MeasurementDto {
  /// Returns a new [MeasurementDto] instance.
  MeasurementDto({
    this.measurementTime,
    this.aqi,
    this.pM10,
    this.pM25,
    this.co,
    this.sO2,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? measurementTime;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? aqi;

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
  double? pM25;

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
  double? sO2;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeasurementDto &&
          other.measurementTime == measurementTime &&
          other.aqi == aqi &&
          other.pM10 == pM10 &&
          other.pM25 == pM25 &&
          other.co == co &&
          other.sO2 == sO2;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (measurementTime == null ? 0 : measurementTime!.hashCode) +
      (aqi == null ? 0 : aqi!.hashCode) +
      (pM10 == null ? 0 : pM10!.hashCode) +
      (pM25 == null ? 0 : pM25!.hashCode) +
      (co == null ? 0 : co!.hashCode) +
      (sO2 == null ? 0 : sO2!.hashCode);

  @override
  String toString() =>
      'MeasurementDto[measurementTime=$measurementTime, aqi=$aqi, pM10=$pM10, pM25=$pM25, co=$co, sO2=$sO2]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.measurementTime != null) {
      json[r'measurementTime'] =
          this.measurementTime!.toUtc().toIso8601String();
    } else {
      json[r'measurementTime'] = null;
    }
    if (this.aqi != null) {
      json[r'aqi'] = this.aqi;
    } else {
      json[r'aqi'] = null;
    }
    if (this.pM10 != null) {
      json[r'pM10'] = this.pM10;
    } else {
      json[r'pM10'] = null;
    }
    if (this.pM25 != null) {
      json[r'pM2_5'] = this.pM25;
    } else {
      json[r'pM2_5'] = null;
    }
    if (this.co != null) {
      json[r'co'] = this.co;
    } else {
      json[r'co'] = null;
    }
    if (this.sO2 != null) {
      json[r'sO2'] = this.sO2;
    } else {
      json[r'sO2'] = null;
    }
    return json;
  }

  /// Returns a new [MeasurementDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MeasurementDto? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "MeasurementDto[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "MeasurementDto[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MeasurementDto(
        measurementTime: mapDateTime(json, r'measurementTime', r''),
        aqi: mapValueOfType<int>(json, r'aqi')?.toDouble(),
        pM10: mapValueOfType<double>(json, r'pM10'),
        pM25: mapValueOfType<double>(json, r'pM2_5'),
        co: mapValueOfType<double>(json, r'co'),
        sO2: mapValueOfType<double>(json, r'sO2'),
      );
    }
    return null;
  }

  static List<MeasurementDto> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <MeasurementDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MeasurementDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MeasurementDto> mapFromJson(dynamic json) {
    final map = <String, MeasurementDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MeasurementDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MeasurementDto-objects as value to a dart map
  static Map<String, List<MeasurementDto>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<MeasurementDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MeasurementDto.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
