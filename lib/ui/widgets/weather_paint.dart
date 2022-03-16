import 'package:advanced_widgets/models/weather_state.dart';
import 'package:flutter/material.dart';

class WeatherPaint extends CustomPainter {
  final WeatherState weather;

  @override
  void paint(Canvas canvas, Size size) {
    double squareX = size.width / 10;
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
    canvas.drawCircle(
        Offset(8 * squareX, 2 * squareX), 2 * squareX, _sunPainter);

    // draw a cloud
    final _cloudPath = Path()
      ..addRect(Rect.fromLTRB(
          5 * squareX + 4, 3 * squareX - 2, 9.5 * squareX, 4 * squareX - 2))
      ..addOval(Rect.fromCenter(
          center: Offset(5.5 * squareX - 2, 3 * squareX - 1),
          width: 2 * squareX,
          height: 2 * squareX - 2))
      ..addOval(Rect.fromCenter(
          center: Offset(7.3 * squareX, 2.4 * squareX),
          width: 2.6 * squareX,
          height: 2 * squareX + 5))
      ..addOval(Rect.fromCenter(
          center: Offset(9.5 * squareX - 2, 3 * squareX - 1),
          width: 2 * squareX,
          height: 2 * squareX - 2));
    canvas.drawPath(_cloudPath, _cloudPainter);

    //draw a rain
    canvas.drawLine(Offset(6 * squareX, 4.2 * squareX),
        Offset(5.5 * squareX, 5 * squareX), _rainPainter);
    canvas.drawLine(Offset(7.4 * squareX, 4.2 * squareX),
        Offset(6.9 * squareX, 5 * squareX), _rainPainter);
    canvas.drawLine(Offset(8.8 * squareX, 4.2 * squareX),
        Offset(8.3 * squareX, 5 * squareX), _rainPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  WeatherPaint(this.weather);
}
