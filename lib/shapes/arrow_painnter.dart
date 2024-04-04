import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    Path path = Path();

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    path.moveTo(0, centerY);

    path.lineTo(size.width - size.width / 2, centerY);

    path.lineTo(centerX, centerY - centerY / 4);

    // bottom point
    path.lineTo(centerX + size.width / 5, centerY + 10);

    path.lineTo(centerX, centerY + centerY / 4 + 20);

    path.lineTo(centerX, centerY + 20);
    path.lineTo(0, centerY + 20);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
