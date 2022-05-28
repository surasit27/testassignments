import 'package:flutter/material.dart';

class Constant {
  // Genernal
  static String appName = 'CAMPING';
  //Rout
  static String routeHome = '/home';

  //Color
  static Color dark = Color(0xFF0F1E56);
  static Color primary = Color(0xFF134B8A);
  static Color gray = Color(0xFFC3BEBB);
  static Color light = Color(0xFFC4D3E9);

  //TextColor
  static Color tdark = Color(0xFF000000);
  static Color tgray3 = Color(0xFF605C5C);
  static Color tgray2 = Color(0xFF9E9E9E);
  static Color tgray1 = Color(0xFFE0E0E0);
  static Color tlight = Color(0xFFFFFFFF);

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
