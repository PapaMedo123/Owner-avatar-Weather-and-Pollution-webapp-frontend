import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:openapi/api.dart';
import 'package:weather_application_frontend/logic/services/location_service.dart';
import 'package:equatable/equatable.dart';

part 'current_measurement_state.dart';

class StationCubit extends Cubit<StationState> {
  StationCubit() : super(const UnStationState());

  Future<void> fetchLocationMeasurement() async {
    try {
      Position position = await LocationService().getCurrentPosition();
      StationDto? stationDto = await BaseCityApi().apiCityNearestGet(
          latitude: position.latitude, longitude: position.longitude);
      if (stationDto != null) {
        emit(InStationState(stationDto));
      }
    } catch (e, stackTrace) {
      developer.log('$e',
          name: 'LoadCurrentMeasurementEvent',
          error: e,
          stackTrace: stackTrace);
      emit(ErrorStationState(e.toString()));
    }
  }
}
