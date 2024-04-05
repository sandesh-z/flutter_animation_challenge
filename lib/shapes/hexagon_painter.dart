import 'dart:math';

import 'package:flutter/material.dart';

class HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // Path path = Path();
    // path.moveTo(size.width / 2, 0); // top point

    // path.lineTo(size.width, size.height / 4);

    // path.lineTo(size.width, size.height - size.height / 4);

    // path.lineTo(size.width / 2, size.height);

    // path.lineTo(0, size.height - size.height / 4);

    // path.lineTo(0, size.height / 4);
    // path.close(); // close the path to draw a complete shape

    // canvas.drawPath(path, paint);

    //draw equal sides(with chatgpt)
    double sideLength = size.width / 2;

    double centerX = size.width / 2;
    double centerY = size.height / 2;

    Path path = Path();

    path.moveTo(centerX + sideLength * cos(0), centerY + sideLength * sin(0));

    for (int i = 1; i <= 6; i++) {
      path.lineTo(
        centerX + sideLength * cos(i * 2 * pi / 6),
        centerY + sideLength * sin(i * 2 * pi / 6),
      );
    }

    path.close(); // close the path to draw a complete shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
