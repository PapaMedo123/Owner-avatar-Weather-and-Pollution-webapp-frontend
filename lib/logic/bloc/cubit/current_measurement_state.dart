part of 'current_measurement_cubit.dart';

@immutable
sealed class StationState extends Equatable {
  const StationState(this.stationDto);

  final StationDto? stationDto;

  @override
  List<Object> get props => [];
}

/// UnInitialized
class UnStationState extends StationState {
  const UnStationState() : super(null);

  @override
  String toString() => 'UnCurrentMeasurementStateState';
}

/// Initialized
class InStationState extends StationState {
  const InStationState(super.measurementDto);

  @override
  String toString() => 'InCurrentMeasurementStateState $stationDto';

  @override
  List<Object> get props => [stationDto!];
}

class ErrorStationState extends StationState {
  const ErrorStationState(this.errorMessage) : super(null);

  final String errorMessage;

  @override
  String toString() => 'ErrorCurrentMeasurementState';

  @override
  List<Object> get props => [errorMessage];
}
