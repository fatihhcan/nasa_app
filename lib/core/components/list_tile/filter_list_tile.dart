import 'package:flutter/material.dart';
import 'package:nasa_app/core/extensions/context_extension.dart';

import '../../base/cubits/nasa_vehicle_cubit/nasa_vehicle_cubit.dart';
import '../../utils/locator.dart';

class FilterListTile extends StatelessWidget {
  final void Function()? onPressed;
  final int? index;

  const FilterListTile({Key? key, this.onPressed, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TextButton(
          onPressed: onPressed,
          child: Text(
            sl<NasaVehicleCubit>().vehiclesCamera[index!],
            style: context.textTheme.headline3!.copyWith(color: Colors.white),
          )),
      trailing: sl<NasaVehicleCubit>().vehiclesCameraCheck[index!]
          ? Icon(Icons.check_box)
          : Icon(Icons.check_box_outline_blank),
    );
  }
}
/**
 *  () {
            setState(() {
              check = !check;
              sl<NasaVehicleCubit>().vehiclesCameraFilter(index, context);
            });
          }
 */