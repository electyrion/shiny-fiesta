import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> orange = <int, Color>{
    50: Color(0xFFFCF2E7),
    100: Color(0xFFF8DEC3),
    200: Color(0xFFF3C89C),
    300: Color(0xFFEEB274),
    400: Color(0xFFEAA256),
    500: Color(0xFFE69138),
    600: Color(0xFFE38932),
    700: Color(0xFFDF7E2B),
    800: Color(0xFFDB7424),
    900: Color(0xFFD56217)
  };

  static const eggShell = Color.fromRGBO(231, 239, 213, 1);
  static const brightGrey = Color.fromRGBO(237, 237, 237, 1);
  static const oliveGreen = Color.fromRGBO(167, 180, 82, 1);
  static const darkLemonLime = Color.fromRGBO(134, 176, 45, 1);
  static const darkCharcoal = Color.fromRGBO(52, 56, 46, 1);
  static const mikadoYellow = Color.fromRGBO(255, 189, 19, 1);
  static const backgroundYellow = Color.fromRGBO(243, 229, 158, 1);
}
