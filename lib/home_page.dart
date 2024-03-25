import 'package:flutter/material.dart';
import 'package:flutter_animation_challenge/animated_container/animated_container.dart';
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
            )
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
