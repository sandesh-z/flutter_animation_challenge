import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool animate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter animation challenge"),
      ),
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
              duration: const Duration(milliseconds: 500))),
    );
  }
}
