part of 'nasa_vehicle_cubit.dart';

abstract class NasaVehicleState {}

class NasaVehicleInital extends NasaVehicleState {}

class NasaVehicleLoading extends NasaVehicleState {}

class NasaVehicleCompleted<T> extends NasaVehicleState {
    final List<T> response;

  NasaVehicleCompleted(this.response);

}

class NasaVehicleError extends NasaVehicleState {
  final String message;
  final String statusCode;

  NasaVehicleError(this.message, this.statusCode);
}


