import 'package:advanced_widgets/models/weather_state.dart';
import 'package:redux/redux.dart';

import '../actions/change_weather_action.dart';

Reducer<WeatherState> weatherReducer = combineReducers<WeatherState>(
    [TypedReducer<WeatherState, SetWeatherState>(_setWeatherState)]);

WeatherState _setWeatherState(WeatherState state, SetWeatherState action) {
  return WeatherState.setWeather(action.weather);
}
