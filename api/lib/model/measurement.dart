//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Measurement {
  /// Returns a new [Measurement] instance.
  Measurement({
    this.id,
    required this.measurementTime,
    required this.stationId,
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
  int? id;

  DateTime measurementTime;

  int stationId;

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
  bool operator ==(Object other) => identical(this, other) || other is Measurement &&
    other.id == id &&
    other.measurementTime == measurementTime &&
    other.stationId == stationId &&
    other.aqi == aqi &&
    other.pM10 == pM10 &&
    other.pM25 == pM25 &&
    other.co == co &&
    other.sO2 == sO2;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (measurementTime.hashCode) +
    (stationId.hashCode) +
    (aqi == null ? 0 : aqi!.hashCode) +
    (pM10 == null ? 0 : pM10!.hashCode) +
    (pM25 == null ? 0 : pM25!.hashCode) +
    (co == null ? 0 : co!.hashCode) +
    (sO2 == null ? 0 : sO2!.hashCode);

  @override
  String toString() => 'Measurement[id=$id, measurementTime=$measurementTime, stationId=$stationId, aqi=$aqi, pM10=$pM10, pM25=$pM25, co=$co, sO2=$sO2]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'measurementTime'] = this.measurementTime.toUtc().toIso8601String();
      json[r'stationId'] = this.stationId;
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

  /// Returns a new [Measurement] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Measurement? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Measurement[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Measurement[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Measurement(
        id: mapValueOfType<int>(json, r'id'),
        measurementTime: mapDateTime(json, r'measurementTime', r'')!,
        stationId: mapValueOfType<int>(json, r'stationId')!,
        aqi: mapValueOfType<double>(json, r'aqi'),
        pM10: mapValueOfType<double>(json, r'pM10'),
        pM25: mapValueOfType<double>(json, r'pM2_5'),
        co: mapValueOfType<double>(json, r'co'),
        sO2: mapValueOfType<double>(json, r'sO2'),
      );
    }
    return null;
  }

  static List<Measurement> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Measurement>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Measurement.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Measurement> mapFromJson(dynamic json) {
    final map = <String, Measurement>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Measurement.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Measurement-objects as value to a dart map
  static Map<String, List<Measurement>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Measurement>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Measurement.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'measurementTime',
    'stationId',
  };
}

