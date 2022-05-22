import 'package:get_it/get_it.dart';
import 'package:nasa_app/core/base/cubits/home_cubit/home_cubit.dart';
import 'package:nasa_app/core/base/cubits/nasa_vehicle_cubit/nasa_vehicle_cubit.dart';
import 'package:nasa_app/core/base/repositories/nasa_vehicle_repository.dart';


GetIt getIt = GetIt.instance;

@pragma('vm:prefer-inline')
T sl<T extends Object>() => getIt.get<T>();

setUpLocator() async {
  //Repositories
  getIt.registerLazySingleton(() => SampleNasaVehicleRepository());


  //Cubits
  getIt.registerLazySingleton(() => HomeCubit());
  getIt.registerLazySingleton(() => NasaVehicleCubit(sl()));
 
}
