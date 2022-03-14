import 'package:advanced_widgets/models/weather_state.dart';
import 'package:flutter/material.dart';

class AppState {
  late final ThemeData currentTheme;
  late final WeatherState weatherValue;

  AppState({required this.currentTheme, required this.weatherValue});

  AppState.initState() {
    currentTheme = ThemeData.light();
    weatherValue =
        WeatherState(weatherValue: 0, sunValue: 1, cloudValue: 0, rainValue: 0);
  }
}
