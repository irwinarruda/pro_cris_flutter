import 'package:flutter/material.dart';

class ProCrisColors {
  static const MaterialColor purple = MaterialColor(
    0xFF8C7ECF,
    <int, Color>{
      50: Color(0xFFEAE6FF),
      100: Color(0xFFD6CEFE),
      200: Color(0xFFC2B7F8),
      300: Color(0xFFB0A4ED),
      400: Color(0xFF9D90E0),
      500: Color(0xFF8C7ECF),
      600: Color(0xFF8175BD),
      700: Color(0xFF8175BD),
      800: Color(0xFF8175BD),
      900: Color(0xFF8175BD),
    },
  );
  static const MaterialColor gold = MaterialColor(
    0xFFBFB673,
    <int, Color>{
      100: Color(0xFFF2E9A2),
      200: Color(0xFFE5DC95),
      300: Color(0xFFDBD28A),
      400: Color(0xFFCFC57F),
      500: Color(0xFFBFB673),
      600: Color(0xFFB0A766),
    },
  );
  static const MaterialColor gray = MaterialColor(
    0xFF9999A1,
    <int, Color>{
      50: Color(0xFFEBEBF0),
      100: Color(0xFFDCDCE0),
      200: Color(0xFFD0CFD4),
      300: Color(0xFFC3C3C7),
      400: Color(0xFFB4B4B8),
      500: Color(0xFF9999A1),
    },
  );
  static const MaterialColor red = MaterialColor(
    0xFFEE584F,
    <int, Color>{
      400: Color(0xFFFD7067),
      500: Color(0xFFEE584F),
      900: Color(0xFF996074),
    },
  );
  static const MaterialColor green = MaterialColor(
    0xFF52EA8B,
    <int, Color>{
      400: Color(0xFF61F599),
      500: Color(0xFF52EA8B),
      900: Color(0xFF60A672),
    },
  );
  static const black = Color(0xFF46454D);
  static const white = Color(0xFFFBFAFF);

  static Map<String, Color> custom = {
    'green': Color(0xFF9FE3BC),
    'red': Color(0xFFFFB7B2),
    'blue': Color(0xFFB8C9F5),
    'orange': Color(0xFFF0DD9C),
    'purple': Color(0xFFF2B6F0),
    'black': Color(0xFFCCCCCC),
    'teal': Color(0xFFB6E7F2),
    'yellowGreen': Color(0xFFE6F7AD),
    'brown': Color(0xFFDCCCB5),
    'darkBlue': Color(0xFFB3C9E9),
    'wineRed': Color(0xFFECA1B8),
    'grassGreen': Color(0xFFC8ECAB),
    'cyan': Color(0xFFB9F3F6),
    'lemonGreen': Color(0xFFD1E99E),
    'lavander': Color(0xFFECB3ED),
    'ketchupRed': Color(0xFFE8B3B3),
    'lightCyan': Color(0xFFAEF1F5),
    'lightPurple': Color(0xFFB7C0EE),
  };

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
