import 'package:flutter/material.dart';

Map<int, Color> _swatchBlueOpacity = {
  50: const Color.fromRGBO(15, 29, 51, .1),
  100: const Color.fromRGBO(15, 29, 51, .2),
  200: const Color.fromRGBO(15, 29, 51, .3),
  300: const Color.fromRGBO(15, 29, 51, .4),
  400: const Color.fromRGBO(15, 29, 51, .5),
  500: const Color.fromRGBO(15, 29, 51, .6),
  600: const Color.fromRGBO(15, 29, 51, .7),
  700: const Color.fromRGBO(15, 29, 51, .8),
  800: const Color.fromRGBO(15, 29, 51, .9),
  900: const Color.fromRGBO(15, 29, 51, 1),
};

Map<int, Color> _swatchLightBlueOpacity = {
  50: const Color.fromRGBO(0, 211, 54753, .1),
  100: const Color.fromRGBO(0, 211, 54753, .2),
  200: const Color.fromRGBO(0, 211, 54753, .3),
  300: const Color.fromRGBO(0, 211, 54753, .4),
  400: const Color.fromRGBO(0, 211, 54753, .5),
  500: const Color.fromRGBO(0, 211, 54753, .6),
  600: const Color.fromRGBO(0, 211, 54753, .7),
  700: const Color.fromRGBO(0, 211, 54753, .8),
  800: const Color.fromRGBO(0, 211, 54753, .9),
  900: const Color.fromRGBO(0, 211, 54753, 1),
};

abstract class CustomColors {
  static Color customContrastColor = const Color(0x00d13027);

  static Color customBlueColor = const Color.fromRGBO(15, 29, 51, 1);

  static Color customLightBlueColor = const Color(0x00d3d5e1);

  static Color customLightGrayColor = const Color(0x007a7d85);

  static const Color backgroundColor2 = Color(0xFF17203A);
  static const Color backgroundColorLight = Color(0xFFF2F6FF);
  static const Color backgroundColorDark = Color(0xFF25254B);
  static const Color shadowColorLight = Color(0xFF4A5367);
  static const Color shadowColorDark = Colors.black;

  static const Color shadowColorGrey = Color.fromARGB(255, 158, 158, 158);

  static Color black = Colors.black;
  static Color background = Colors.white.withAlpha(190);
  static Color white = Colors.white;

  static MaterialColor customSwatchBlueColor =
      MaterialColor(0x0F1D33, _swatchBlueOpacity);

  static MaterialColor customSwatchLightBlueColor =
      MaterialColor(0x00d3d5e1, _swatchLightBlueOpacity);
}

abstract class CustomFontSizes {
  static double fontSize10 = 10;
  static double fontSize12 = 12;
  static double fontSize14 = 14;
  static double fontSize16 = 16;
  static double fontSize18 = 18;
  static double fontSize20 = 20;
  static double fontSize22 = 22;
  static double fontSize24 = 24;
}
