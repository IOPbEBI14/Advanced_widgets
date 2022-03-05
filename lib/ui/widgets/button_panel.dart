import 'package:advanced_widgets/actions/current_theme_action.dart';
import 'package:flutter/material.dart';

class ButtonPanel extends StatelessWidget{
  final dynamic store;
   const ButtonPanel({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  store.dispatch(LightThemeAction());
                },
                child: Container(
                  height: 10, // устанавливаем высоту 10
                ),),
            ),
            Expanded(
              child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  store.dispatch(RedThemeAction());
                },
                child: Container(
                  height: 10, // устанавливаем высоту 10
                ),),
            ),
            Expanded(
              child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  store.dispatch(GreenThemeAction());
                },
                child: Container(
                  height: 10, // устанавливаем высоту 10
                ),),
            ),
            Expanded(
              child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.blue),
                onPressed: () {
                  store.dispatch(BlueThemeAction());
                },
                child: Container(
                  height: 10, // устанавливаем высоту 10
                ),),
            ),
            Expanded(
              child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  store.dispatch(DarkThemeAction());
                },
                child: Container(
                  height: 10, // устанавливаем высоту 10
                ),),
            ),
          ],
        );

  }

}