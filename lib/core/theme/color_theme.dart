import 'package:flutter/material.dart';

class ColorThemeLight {
  static ColorThemeLight? _instance;
  static ColorThemeLight? get instance {
    return _instance ??= ColorThemeLight.init();
  }

  ColorThemeLight.init();

  final Color jacksonsPurple = const Color(0xff242F9B);
  final Color moodyBlue = const Color(0xff646FD4);
  final Color bilobaFlower = const Color(0xff9BA3EB);
  final Color hawkesBlue = const Color(0xffDBDFFD);
  final Color doveGray = const Color(0xff707070);

  ColorScheme get colorScheme => ColorScheme(
      primary: doveGray, //xx
      primaryVariant: doveGray,
      secondary: moodyBlue, 
      secondaryVariant: moodyBlue, 
      surface: doveGray,
      background: doveGray, 
      error: Colors.red,
      onPrimary: jacksonsPurple, 
      onSecondary: Colors.black,
      onSurface: Colors.white30,
      onBackground: doveGray,
      onError: Colors.red,
      brightness: Brightness.dark);
}
