import 'package:flutter/material.dart';
import 'package:flutter_animation_challenge/curves/bezier_curves/bezier_paint_one.dart';

class CurvesPage extends StatelessWidget {
  const CurvesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.white,
            height: double.maxFinite,
            width: double.maxFinite,
            child: CustomPaint(
              painter: BezierCurveOne(),
            ),
          ),
        ),
      ),
    );
  }
}
