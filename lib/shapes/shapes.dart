import 'package:flutter/material.dart';
import 'package:flutter_animation_challenge/shapes/arrow_painnter.dart';
import 'package:flutter_animation_challenge/shapes/daimond_painter.dart';
import 'package:flutter_animation_challenge/shapes/hexagon_painter.dart';

class ShapePage extends StatelessWidget {
  const ShapePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              _shapeItem(painter: DiamondPainter()),
              _shapeItem(painter: ArrowPainter()),
              _shapeItem(painter: HexagonPainter()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shapeItem({required CustomPainter? painter}) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.deepOrange),
          borderRadius: BorderRadius.circular(20.0)),
      child: CustomPaint(
        size: const Size(400, 400),
        painter: painter,
      ),
    );
  }
}
