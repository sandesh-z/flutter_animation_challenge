import 'package:flutter/material.dart';

class AnimatedCircle extends StatefulWidget {
  const AnimatedCircle({super.key});

  @override
  State<AnimatedCircle> createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double _radius = 0.0;
  final double targetRadius = 50.0; // Change this to your desired final radius
  final Duration duration =
      const Duration(seconds: 2); // Change this to your desired duration

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );

    _animation = Tween<double>(begin: 0, end: targetRadius).animate(_controller)
      ..addListener(() {
        setState(() {
          _radius = _animation.value;
        });
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: CirclePainter(_radius),
          size: const Size(200, 200), // Adjust size as per your requirement
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CirclePainter extends CustomPainter {
  final double radius;

  CirclePainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 20, paint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
