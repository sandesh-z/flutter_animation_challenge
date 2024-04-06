import 'package:flutter/material.dart';

class ConcentricCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    Paint paint2 = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    Paint paint3 = Paint()
      ..color = Colors.blue.withOpacity(.3)
      ..style = PaintingStyle.fill;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    canvas.drawCircle(Offset(centerX, centerY), 100.0, paint3);
    canvas.drawCircle(Offset(centerX, centerY), 20.0, paint);
    canvas.drawCircle(Offset(centerX, centerY), 10.0, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
