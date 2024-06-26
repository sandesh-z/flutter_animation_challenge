import 'package:flutter/material.dart';
import 'package:flutter_animation_challenge/animated_circle/animated_circle.dart';
import 'package:flutter_animation_challenge/animated_container/animated_container.dart';
import 'package:flutter_animation_challenge/animated_image/animated_image.dart';
import 'package:flutter_animation_challenge/curves/curves.dart';
import 'package:flutter_animation_challenge/curves/wave/wave.dart';
import 'package:flutter_animation_challenge/shake_widget/shake_widget.dart';
import 'package:flutter_animation_challenge/shapes/shapes.dart';
import 'package:flutter_animation_challenge/swippable_stack/swippable_stack.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter animation challenge"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _PageItem(
              pageName: "Animated container",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const AnimatedContainerPage()));
              },
            ),
            const SizedBox(height: 10.0),
            _PageItem(
              pageName: "Swippable Stack",
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SwippableStack())),
            ),
            const SizedBox(height: 10.0),
            _PageItem(
              pageName: "Zoomed Image Effect",
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AnimatedImage())),
            ),
            const SizedBox(height: 10.0),
            _PageItem(
              pageName: "Curves",
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const CurvesPage())),
            ),
            const SizedBox(height: 10.0),
            _PageItem(
              pageName: "Wave",
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const WavePage())),
            ),
            const SizedBox(height: 10.0),
            _PageItem(
              pageName: "Shapes",
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const ShapePage())),
            ),
            const SizedBox(height: 10.0),
            _PageItem(
              pageName: "Animated Circle",
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AnimatedCircle())),
            ),
            const SizedBox(height: 10.0),
            _PageItem(
              pageName: "Shake Widget",
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ShakeWidget())),
            ),
          ],
        ));
  }
}

class _PageItem extends StatelessWidget {
  final String pageName;
  final void Function()? onTap;
  const _PageItem({required this.pageName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        tileColor: Colors.deepOrange,
        title: Text(
          pageName,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        onTap: onTap);
  }
}
