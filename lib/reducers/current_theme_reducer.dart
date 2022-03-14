import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../actions/current_theme_action.dart';

Reducer<ThemeData> currentThemeReducer = combineReducers<ThemeData>([
  TypedReducer<ThemeData, LightThemeAction>(_lightReducer),
  TypedReducer<ThemeData, DarkThemeAction>(_darkReducer),
  TypedReducer<ThemeData, RedThemeAction>(_redReducer),
  TypedReducer<ThemeData, GreenThemeAction>(_greenReducer),
  TypedReducer<ThemeData, BlueThemeAction>(_blueReducer),
]);

ThemeData _redReducer(ThemeData theme, RedThemeAction action) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.red,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.red,
    ).copyWith(
      secondary: Colors.red,
    ),
    textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
  );
}

ThemeData _greenReducer(ThemeData theme, GreenThemeAction action) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.green,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.green,
    ).copyWith(
      secondary: Colors.green,
    ),
    textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.pink)),
  );
}

ThemeData _blueReducer(ThemeData theme, BlueThemeAction action) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.blue,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
    ).copyWith(
      secondary: Colors.blue,
    ),
    textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.greenAccent)),
  );
}

ThemeData _lightReducer(ThemeData theme, LightThemeAction action) =>
    ThemeData.light();

ThemeData _darkReducer(ThemeData theme, DarkThemeAction action) =>
    ThemeData.dark();
