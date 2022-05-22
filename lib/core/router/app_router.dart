
import 'package:flutter/material.dart';

import '../../view/home/view/home_view.dart';
import '../../view/launch/view/splash_view.dart';
import '../constants/router_constant.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouterConstant.SPLASH_VIEW:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case RouterConstant.HOME_VIEW:
        return MaterialPageRoute(
          builder: (_) =>  HomeView(),
        );
      default:
        return null;
    }
  }
}
