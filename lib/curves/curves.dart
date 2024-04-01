import 'package:flutter/material.dart';
import 'package:flutter_animation_challenge/curves/bezier_curves/bezier_paint_one.dart';
import 'package:flutter_animation_challenge/curves/bezier_curves/bezier_paint_two.dart';

class CurvesPage extends StatelessWidget {
  const CurvesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _curveContainer(painter: BzierPaintOne()),
              _curveContainer(painter: BezierPaintTwo())
            ],
          ),
        ),
      ),
    );
  }

  Widget _curveContainer({required CustomPainter painter}) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: CustomPaint(
          size: const Size.square(400),
          painter: painter,
        ),
      ),
    );
  }
}
