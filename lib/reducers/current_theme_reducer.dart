import 'package:flutter/material.dart';

import '../actions/current_theme_action.dart';

ThemeData reducer(ThemeData state, dynamic action) {
  if (action is DarkThemeAction) {
    return ThemeData.dark();
  } else if (action is LightThemeAction) {
    return ThemeData.light();
  } else if (action is RedThemeAction) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.red,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ).copyWith(
        secondary: Colors.red,
      ),
      textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
    );
  } else if (action is GreenThemeAction) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.green,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green,
      ).copyWith(
        secondary: Colors.green,
      ),
      textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.pink)),
    );
  } else if (action is BlueThemeAction) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.blue,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue,
      ).copyWith(
        secondary: Colors.blue,
      ),
      textTheme:
          const TextTheme(bodyText2: TextStyle(color: Colors.greenAccent)),
    );
  } else {
    return state;
  }
}
