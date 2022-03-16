import 'package:advanced_widgets/models/app_state.dart';
import 'package:advanced_widgets/ui/widgets/button_panel.dart';
import 'package:advanced_widgets/ui/widgets/inner_shadow.dart';
import 'package:advanced_widgets/ui/widgets/weather_paint.dart';
import 'package:advanced_widgets/ui/widgets/weather_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

const double maxAnimationValue = 300;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    sizeAnimation =
        Tween<double>(begin: 100, end: maxAnimationValue).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) => Theme(
        data: state.currentTheme,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: maxAnimationValue,
                child: GestureDetector(
                  onTap: () => {
                    if (!controller.isCompleted)
                      controller.forward()
                    else
                      controller.reset()
                  },
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    child: SizedBox(
                      width: sizeAnimation.value,
                      child: CustomPaint(
                        painter: WeatherPaint(state.weatherValue),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  maxAnimationValue -
                                  180,
                              child: InnerShadow(
                                  child:
                                      sizeAnimation.value == maxAnimationValue
                                          ? _getWeatherText(
                                              state.weatherValue.weatherValue)
                                          : const Text('')))),
                    ],
                  ),
                ],
              ),
              const WeatherSlider(),
              const ButtonPanel()
            ],
          ),
        ),
      ),
    );
  }

  Widget _getWeatherText(double weatherValue) {
    int gradus = (-15.0 * weatherValue + 25).ceil();
    if (weatherValue >= 0.3 && weatherValue < 0.7) {
      return Text('Облачно, $gradus градусов');
    }
    if (weatherValue >= 0.7) {
      return Text('Дождь, $gradus градусов');
    }
    return Text('Ясно, $gradus градусов');
  }
}
