import 'package:flutter/material.dart';
import 'package:pro_cris_flutter/styles/pro_cris_colors.dart';

class ProCrisTheme {
  static ThemeData theme = ThemeData(
    primarySwatch: ProCrisColors.purple,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: ProCrisColors.purple,
      backgroundColor: Colors.white,
      primaryColorDark: ProCrisColors.black,
      accentColor: ProCrisColors.gold,
    ),
    fontFamily: 'Quicksand',
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: ProCrisColors.white,
      hoverColor: ProCrisColors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: ProCrisColors.gray[400]!,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ProCrisColors.gray[400]!,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ProCrisColors.red,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ProCrisColors.gold,
          width: 2,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 16,
      ),
    ),
    // textTheme: TextTheme(
    //   headline1: TextStyle(color: ProCrisColors.black),
    //   headline2: TextStyle(color: ProCrisColors.black),
    //   bodyText2: TextStyle(color: ProCrisColors.black),
    //   subtitle1: TextStyle(color: ProCrisColors.black),
    // ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ProCrisColors.gold[600],
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ProCrisColors.white,
        backgroundColor: ProCrisColors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        side: BorderSide(
          color: ProCrisColors.gold,
          width: 1,
        ),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 18),
      ),
    ),
  );
}
