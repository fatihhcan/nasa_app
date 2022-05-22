import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/core/base/model/nasa_vehicle_model.dart';
import 'package:nasa_app/core/utils/camera_filter_enum.dart';

import '../../../utils/network_error.dart';
import '../../repositories/nasa_vehicle_repository.dart';

part 'nasa_vehicle_state.dart';

class NasaVehicleCubit extends Cubit<NasaVehicleState> {
  final SampleNasaVehicleRepository _sampleNasaVehicleRepository;
  NasaVehicleCubit(this._sampleNasaVehicleRepository)
      : super(NasaVehicleInital());
  List<Photo> nasaSpiritVehicles = [];
  List<Photo> nasaOpportunityVehicles = [];
  List<Photo> nasaCuriosityVehicles = [];
  CameraFilterName? cameraFilterName;
     String filterName = "";

  Future<void> getNasaSpiritVehicles() async {
    try {
      final response =
          await _sampleNasaVehicleRepository.getNasaSpiritVehicles();
      nasaSpiritVehicles = response;
      emit(NasaVehicleCompleted(response));
    } on NetworkError catch (e) {
      emit(NasaVehicleError(e.message, e.statusCode));
    }
  }

  Future<void> getNasaOpportunityVehicles() async {
    try {
      final response =
          await _sampleNasaVehicleRepository.getNasaOpportunityVehicles();
      nasaOpportunityVehicles = response;
      emit(NasaVehicleCompleted(response));
    } on NetworkError catch (e) {
      emit(NasaVehicleError(e.message, e.statusCode));
    }
  }

  Future getNasaCuriosityVehicles(int page) async {
    try {
      final response =
          await _sampleNasaVehicleRepository.getNasaCuriosityVehicles(page);
      nasaCuriosityVehicles = response;
      emit(NasaVehicleCompleted(response));
    } on NetworkError catch (e) {
      emit(NasaVehicleError(e.message, e.statusCode));
    }
  }

  List<String> vehiclesCamera = [
    "NAVCAM",
    "PANCAM",
    "FHAZ",
    "RHAZ",
    "MAST",
    "CHEMCAM",
    "MAHLI",
    "MARDI",
    "MINITES"
  ];
  List<bool> vehiclesCameraCheck = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  vehiclesCameraFilter(int index,  BuildContext context) {
 
    switch (vehiclesCamera[index]) {
      case "NAVCAM":
        filterName = "NAVCAM";
        Navigator.pop(context);
        vehiclesCameraCheck[0] = !vehiclesCameraCheck[0];
        return CameraFilterName.NAVCAM;
      case "PANCAM":
        filterName = "PANCAM";
        Navigator.pop(context);
        vehiclesCameraCheck[1] = !vehiclesCameraCheck[1];
        return CameraFilterName.PANCAM;
      case "FHAZ":
        filterName = "FHAZ";
        Navigator.pop(context);
        vehiclesCameraCheck[2] = !vehiclesCameraCheck[2];
        return CameraFilterName.FHAZ;

      case "RHAZ":
        filterName = "RHAZ";
        Navigator.pop(context);
        vehiclesCameraCheck[3] = !vehiclesCameraCheck[3];
        return CameraFilterName.RHAZ;
      case "MAST":
        filterName = "MAST";
        Navigator.pop(context);
        vehiclesCameraCheck[4] = !vehiclesCameraCheck[4];
        return CameraFilterName.MAST;
      case "CHEMCAM":
        filterName = "CHEMCAM";
        Navigator.pop(context);
        vehiclesCameraCheck[5] = !vehiclesCameraCheck[5];
        return CameraFilterName.CHEMCAM;
      case "MAHLI":
        filterName = "MAHLI";
        Navigator.pop(context);
        vehiclesCameraCheck[6] = !vehiclesCameraCheck[6];
        return CameraFilterName.MAHLI;
      case "MARDI":
        filterName = "MARDI";
        Navigator.pop(context);
       vehiclesCameraCheck[7] =
            !vehiclesCameraCheck[7];
        return CameraFilterName.MARDI;
      case "MINITES":
      filterName = "MINITES";
      Navigator.pop(context);
      vehiclesCameraCheck[8] =
          !vehiclesCameraCheck[8];
        return CameraFilterName.MINITES;
      default:
    }
  }

  /* vehiclesCameraFilters(String filterName, BuildContext context, int index) {
    if (vehiclesCamera[index] == "NAVCAM") {
      filterName = "NAVCAM";
      Navigator.pop(context);
      vehiclesCameraCheck[0] = vehiclesCameraCheck[0];
    } else if (sl<NasaVehicleCubit>().vehiclesCamera[index] == "PANCAM") {
      filterName = "PANCAM";
      Navigator.pop(context);
      sl<NasaVehicleCubit>().vehiclesCameraCheck[1] =
          !sl<NasaVehicleCubit>().vehiclesCameraCheck[1];
    } else if (sl<NasaVehicleCubit>().vehiclesCamera[index] == "FHAZ") {
      filterName = "FHAZ";
      Navigator.pop(context);
      sl<NasaVehicleCubit>().vehiclesCameraCheck[2] =
          !sl<NasaVehicleCubit>().vehiclesCameraCheck[2];
    } else if (sl<NasaVehicleCubit>().vehiclesCamera[index] == "RHAZ") {
      filterName = "RHAZ";
      Navigator.pop(context);
      sl<NasaVehicleCubit>().vehiclesCameraCheck[3] =
          !sl<NasaVehicleCubit>().vehiclesCameraCheck[3];
    } else if (sl<NasaVehicleCubit>().vehiclesCamera[index] == "MAST") {
      filterName = "MAST";
      Navigator.pop(context);
      sl<NasaVehicleCubit>().vehiclesCameraCheck[4] =
          !sl<NasaVehicleCubit>().vehiclesCameraCheck[4];
    } else if (sl<NasaVehicleCubit>().vehiclesCamera[index] == "CHEMCAM") {
      filterName = "CHEMCAM";
      Navigator.pop(context);
      sl<NasaVehicleCubit>().vehiclesCameraCheck[5] =
          !sl<NasaVehicleCubit>().vehiclesCameraCheck[5];
    } else if (sl<NasaVehicleCubit>().vehiclesCamera[index] == "MAHLI") {
      filterName = "MAHLI";
      Navigator.pop(context);
      sl<NasaVehicleCubit>().vehiclesCameraCheck[6] =
          !sl<NasaVehicleCubit>().vehiclesCameraCheck[6];
    } else if (sl<NasaVehicleCubit>().vehiclesCamera[index] == "MARDI") {
      filterName = "MARDI";
      Navigator.pop(context);
      sl<NasaVehicleCubit>().vehiclesCameraCheck[7] =
          !sl<NasaVehicleCubit>().vehiclesCameraCheck[7];
    } else if (sl<NasaVehicleCubit>().vehiclesCamera[index] == "MINITES") {
      filterName = "MINITES";
      Navigator.pop(context);
      sl<NasaVehicleCubit>().vehiclesCameraCheck[8] =
          !sl<NasaVehicleCubit>().vehiclesCameraCheck[8];
    }
  } */
}
