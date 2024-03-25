import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  bool animate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          onPressed: () {
            setState(() {
              animate = !animate;
            });
          },
          child: const Text("Animate")),
      body: Center(
        child: AnimatedContainer(
            color: Colors.deepPurple,
            height: animate ? 400 : 200,
            width: 200,
            duration: const Duration(milliseconds: 500)),
      ),
    );
  }
}
