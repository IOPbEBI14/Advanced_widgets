import 'package:advanced_widgets/models/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../../models/app_state.dart';

class WeatherPaint extends CustomPainter {
  final WeatherState weather;

  @override
  void paint(Canvas canvas, Size size) {
    double squareX = size.width / 10;
    double squareY = size.height / 20;

    final _sunPainter = Paint()
      ..color = Colors.yellowAccent.withOpacity(weather.sunValue)
      ..style = PaintingStyle.fill;

    final _cloudPainter = Paint()
      ..color = Colors.blueGrey.withOpacity(weather.cloudValue)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    final _rainPainter = Paint()
      ..color = Colors.indigo.withOpacity(weather.rainValue)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    // draw the Sun
    canvas.drawCircle(Offset(6 * squareX, squareY / 6), 30, _sunPainter);

    // draw a cloud
    final _cloudPath = Path()
      ..addRect(Rect.fromLTRB(
          3 * squareX + 2, squareY / 2, 7 * squareX - 1, 2 * squareY))
      ..addOval(Rect.fromCenter(
          center: Offset(3.5 * squareX, squareY),
          width: 2 * squareX,
          height: 2 * squareY))
      ..addOval(Rect.fromCenter(
          center: Offset(5 * squareX, squareY),
          width: 2 * squareX,
          height: 2 * squareY))
      ..addOval(Rect.fromCenter(
          center: Offset(6.5 * squareX, squareY),
          width: 2 * squareX,
          height: 2 * squareY));
    canvas.drawPath(_cloudPath, _cloudPainter);

    //draw a rain
    canvas.drawLine(Offset(6 * squareX, 2.3 * squareY),
        Offset(5.3 * squareX, 3.1 * squareY), _rainPainter);
    canvas.drawLine(Offset(5 * squareX, 2.3 * squareY),
        Offset(4.3 * squareX, 3.1 * squareY), _rainPainter);
    canvas.drawLine(Offset(4 * squareX, 2.3 * squareY),
        Offset(3.3 * squareX, 3.1 * squareY), _rainPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  WeatherPaint(this.weather);
}
