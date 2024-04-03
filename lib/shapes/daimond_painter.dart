import 'package:flutter/material.dart';

class DiamondPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(size.width / 2, 0); // top point
    path.lineTo(size.width, size.height / 2); // right point
    path.lineTo(size.width / 2, size.height); // bottom point
    path.lineTo(0, size.height / 2); // left point
    path.close(); // close the path to draw a complete shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
