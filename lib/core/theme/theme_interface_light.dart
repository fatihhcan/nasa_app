

import 'package:nasa_app/core/theme/color_theme.dart';

import 'text_theme.dart';

abstract class ILightTheme {
  TextThemeLight? textThemeDark = TextThemeLight.instance;
  ColorThemeLight? colorThemeLight = ColorThemeLight.instance;
}
