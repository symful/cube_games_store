import 'package:flutter/material.dart';

final ThemeData popupTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xffffffff),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(letterSpacing: 2),
    headlineMedium: TextStyle(letterSpacing: 2),
    headlineSmall: TextStyle(letterSpacing: 2),
    titleLarge: TextStyle(letterSpacing: 2),
    titleMedium: TextStyle(letterSpacing: 2),
    titleSmall: TextStyle(letterSpacing: 2),
    bodyLarge: TextStyle(letterSpacing: 2),
    bodyMedium: TextStyle(letterSpacing: 2),
    bodySmall: TextStyle(letterSpacing: 2),
    labelLarge: TextStyle(letterSpacing: 2),
    labelMedium: TextStyle(letterSpacing: 2),
    labelSmall: TextStyle(letterSpacing: 2),
    displayLarge: TextStyle(letterSpacing: 2),
    displayMedium: TextStyle(letterSpacing: 2),
    displaySmall: TextStyle(letterSpacing: 2),
  ).apply(displayColor: Colors.black, bodyColor: Colors.black),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff60CF2C),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      textStyle: const TextStyle(fontFamily: 'Poppins', letterSpacing: 2),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: const Color(0xff60CF2C),
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontFamily: 'Poppins', letterSpacing: 2),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff171A23),
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      fontFamily: 'Revamped',
      fontSize: 24,
      fontWeight: FontWeight.w400,
      letterSpacing: 2,
    ),
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: Color(0xff60CF2C),
    cursorColor: Color(0xff60CF2C),
  ),
  scaffoldBackgroundColor: const Color(0xff171a23),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: const Color(0xff60CF2C),
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontFamily: 'Poppins', letterSpacing: 2),
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(letterSpacing: 2),
    headlineMedium: TextStyle(letterSpacing: 2),
    headlineSmall: TextStyle(letterSpacing: 2),
    titleLarge: TextStyle(letterSpacing: 2),
    titleMedium: TextStyle(letterSpacing: 2),
    titleSmall: TextStyle(letterSpacing: 2),
    bodyLarge: TextStyle(letterSpacing: 2),
    bodyMedium: TextStyle(letterSpacing: 2),
    bodySmall: TextStyle(letterSpacing: 2),
    labelLarge: TextStyle(letterSpacing: 2),
    labelMedium: TextStyle(letterSpacing: 2),
    labelSmall: TextStyle(letterSpacing: 2),
    displayLarge: TextStyle(letterSpacing: 2),
    displayMedium: TextStyle(letterSpacing: 2),
    displaySmall: TextStyle(letterSpacing: 2),
  ).apply(displayColor: Colors.white, bodyColor: Colors.white),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff60CF2C), width: 2),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff60CF2C), width: 2),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    iconColor: Color(0xff60CF2C),
    hintStyle: TextStyle(letterSpacing: 2, color: Colors.white),
    labelStyle: TextStyle(letterSpacing: 2),
    floatingLabelStyle: TextStyle(letterSpacing: 2),
    errorStyle: TextStyle(letterSpacing: 2),
    helperStyle: TextStyle(letterSpacing: 2),
    suffixStyle: TextStyle(letterSpacing: 2),
    prefixStyle: TextStyle(letterSpacing: 2),
    counterStyle: TextStyle(letterSpacing: 2),
  ),
  iconTheme: const IconThemeData(color: Color(0xff65EF23)),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(iconColor: WidgetStatePropertyAll(Color(0xff65EF23))),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff60CF2C),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      textStyle: const TextStyle(fontFamily: 'Poppins', letterSpacing: 2),
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
);
