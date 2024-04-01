import 'package:flutter/material.dart';
import 'package:flutter_animation_challenge/home_page.dart';

void main() {
  runApp(const FlutterAnimationChallengeApp());
}

class FlutterAnimationChallengeApp extends StatelessWidget {
  const FlutterAnimationChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
