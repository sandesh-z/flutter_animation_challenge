import 'dart:math';

import 'package:flutter/material.dart';

class SineCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final double halfHeight = height / 2;
    final double amplitude = height * 0.4;

    final Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Path path = Path();

    for (int i = 0; i <= width.toInt(); i++) {
      final double x = i.toDouble();
      final double sineValue =
          sin((x / width) * 9 * pi); // Adjust frequency here
      final double y = halfHeight + amplitude * sineValue;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(SineCurvePainter oldDelegate) {
    return false;
  }
}
