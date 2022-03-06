import 'package:advanced_widgets/actions/current_theme_action.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class WeatherSlider extends StatelessWidget{
  final dynamic store;
   const WeatherSlider({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _value=0;
        return Container(
          child: SfSlider(
            min: 0.0,
            max: 1.0,
            interval: 0.1,
            showTicks: true,
            showLabels: true,
            minorTicksPerInterval: 1, value: _value, onChanged: (value) { _value=value; },
          ),
        );

  }

}