import 'package:flutter/material.dart';

class Constant {
  // Genernal
  static String appName = 'CAMPING';
  //Rout
  static String routeHome = '/home';

  //Color
  static Color dark = const Color(0xFF0F1E56);
  static Color primary = const Color(0xFF134B8A);
  static Color gray = const Color(0xFFC3BEBB);
  static Color light = const Color(0xFFC4D3E9);

  //TextColor
  static Color tdark = const Color(0xFF000000);
  static Color tgray3 = const Color(0xFF605C5C);
  static Color tgray2 = const Color(0xFF9E9E9E);
  static Color tgray1 = const Color(0xFFE0E0E0);
  static Color tlight = const Color(0xFFFFFFFF);

  //TextStyle
  TextStyle h1Style() => TextStyle(
        fontSize: 20,
        color: tdark,
        fontWeight: FontWeight.w600,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: tdark,
        fontWeight: FontWeight.w600,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 16,
        color: tdark,
        fontWeight: FontWeight.w600,
      );

  TextStyle h4Style() => TextStyle(
        fontSize: 14,
        color: tdark,
        fontWeight: FontWeight.w400,
      );
}

const kDefaultPaddin = 15.0;
