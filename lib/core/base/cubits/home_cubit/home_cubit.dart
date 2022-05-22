import 'package:bloc/bloc.dart';
import 'package:nasa_app/core/base/cubits/nasa_vehicle_cubit/nasa_vehicle_cubit.dart';

import '../../../utils/locator.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  HomeCubit() : super(HomeInitial());

  init(int page) async {
    emit(HomeLoading());
    await sl<NasaVehicleCubit>().getNasaSpiritVehicles();
    await sl<NasaVehicleCubit>().getNasaOpportunityVehicles();
    await sl<NasaVehicleCubit>().getNasaCuriosityVehicles(page);
    emit(HomeCompleted());
  }


}
