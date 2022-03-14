import 'package:advanced_widgets/actions/current_theme_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../actions/change_weather_action.dart';
import '../../models/app_state.dart';

class WeatherSlider extends StatelessWidget {
  const WeatherSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) => SfSlider(
        activeColor: Theme.of(context).backgroundColor,
        inactiveColor: Theme.of(context).backgroundColor,
        min: 0.0,
        max: 1.0,
        interval: 0.1,
        minorTicksPerInterval: 1,
        value: state.weatherValue.weatherValue,
        onChanged: (value) {
          store.dispatch(SetWeatherState(value));
        },
      ),
    );
  }
}
