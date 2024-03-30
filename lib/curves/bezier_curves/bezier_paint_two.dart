import 'package:flutter/material.dart';

class BezierPaintTwo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(0, size.height * .5)
      ..quadraticBezierTo(
        size.width * .5,
        size.height * .08,
        size.width * .95,
        0,
      )
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
