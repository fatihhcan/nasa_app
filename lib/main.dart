import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app/core/base/cubits/home_cubit/home_cubit.dart';
import 'package:nasa_app/core/base/cubits/nasa_vehicle_cubit/nasa_vehicle_cubit.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme_light.dart';
import 'core/utils/locator.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
        providers: [
          BlocProvider<NasaVehicleCubit>(
              create: (context) => sl<NasaVehicleCubit>()),
          BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
        ],
        child: ScreenUtilInit(
        designSize: const Size(428, 926),
          builder: (BuildContext context, child) => MaterialApp(
          theme: AppThemeLight.instance.theme,
          debugShowCheckedModeBanner: false,
          title: 'Nasa App',
          onGenerateRoute: _appRouter.onGenerateRoute,
         // home: HomeView(),
        ),
        ),
        );
  }
}
