import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
);
