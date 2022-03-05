import 'package:advanced_widgets/ui/widgets/button_panel.dart';
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
    Store<ThemeData> store = StoreProvider.of<ThemeData>(context);
    return StoreConnector<ThemeData, ThemeData>(
      converter: (store) => store.state,
      builder: (context, state) => Theme(
        data: state,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'You have pushed the button this many times:',
                      ),
                    ],
                  ),
                ),
              ),
             // WeatherSlider( store: store,),
              ButtonPanel(
                store: store,
              )
            ],
          ),
        ),
      ),
    );
  }
}
