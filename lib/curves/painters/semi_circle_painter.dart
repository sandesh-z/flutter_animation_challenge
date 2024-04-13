import 'package:flutter/material.dart';
import 'dart:math';

class DottedSemicirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Radius of the semicircle
    double radius = size.width / 2;

    Path path = Path();
    path.moveTo(0, centerY);
    path.arcTo(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
        pi,
        pi,
        false);

    // Define the dash pattern (5 pixels dashed followed by 5 pixels gap)
    const dashWidth = 5;
    const dashSpace = 5;
    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      var distance = 0.0;
      while (distance < metric.length) {
        var nextDistance = distance + dashWidth;
        canvas.drawPath(metric.extractPath(distance, nextDistance), paint);
        distance = nextDistance + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
