import 'package:advanced_widgets/models/app_state.dart';

import 'change_weather_reducer.dart';
import 'current_theme_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
      currentTheme: currentThemeReducer(state.currentTheme, action),
      weatherValue: weatherReducer(state.weatherValue, action));
}
