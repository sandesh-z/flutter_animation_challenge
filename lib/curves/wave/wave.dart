import 'package:flutter/material.dart';
import 'package:flutter_animation_challenge/curves/wave/wave_painter.dart';

class WavePage extends StatefulWidget {
  const WavePage({super.key});

  @override
  State<WavePage> createState() => _WavePageState();
}

class _WavePageState extends State<WavePage>
    with SingleTickerProviderStateMixin {
  double waveRadius = 0.0;
  double waveGap = 10.0;
  late Animation<double> _animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _animation = Tween(begin: 0.0, end: waveGap).animate(controller)
      ..addListener(() {
        setState(() {
          waveRadius = _animation.value;
        });
      });

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomPaint(
        size: const Size(double.infinity, double.infinity),
        painter: CircleWavePainter(waveRadius),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
