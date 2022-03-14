import 'package:advanced_widgets/models/app_state.dart';
import 'package:advanced_widgets/ui/widgets/button_panel.dart';
import 'package:advanced_widgets/ui/widgets/weather_paint.dart';
import 'package:advanced_widgets/ui/widgets/weather_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Store<AppState> store = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) => Theme(
        data: state.currentTheme,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.zero,
                    child: SizedBox(
                      width: 200,
                      height: 300,
                      child: CustomPaint(
                        size: const Size.square(300),
                        painter: WeatherPaint(state.weatherValue),
                      ),
                    ),
                  ),
                ),
              ),
              const WeatherSlider(),
              const ButtonPanel()
            ],
          ),
        ),
      ),
    );
  }
}
