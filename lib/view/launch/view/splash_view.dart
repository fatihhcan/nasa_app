
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_app/core/constants/image_constant.dart';
import '../../../core/base/cubits/splash_cubit/splash_cubit.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
        create: (context) => SplashCubit()..splashInit(context),
        child: BlocBuilder<SplashCubit, SplashCubitState>(
          builder: (context, state) {
            return Scaffold(
                backgroundColor: Colors.black,
                body: buildSplashAnimation());
          },
        ));
  }

  Center buildSplashAnimation() {
    return Center(
                child: SizedBox(
                  height: 250.h,
                  child: Lottie.asset(ImageConstants.splashJson)),
              );
  }
}
