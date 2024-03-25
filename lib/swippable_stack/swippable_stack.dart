import 'package:flutter/material.dart';
import 'package:flutter_animation_challenge/swippable_stack/card.dart';
import 'package:flutter_animation_challenge/utils/assets.dart';

class SwippableStack extends StatefulWidget {
  const SwippableStack({super.key});

  @override
  State<SwippableStack> createState() => _SwippableStackState();
}

class _SwippableStackState extends State<SwippableStack>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Stack(
          children: [
            Positioned(
                child: Transform.translate(
              offset: const Offset(35, 0),
              child: AnimatedBuilder(
                animation: animationController,
                child: CardWidget(
                    image: Image.asset(
                  Assets.madMaxPoster,
                  fit: BoxFit.cover,
                )),
                builder: (context, child) => Transform.rotate(
                  angle: animationController.value * -6.03,
                  child: child,
                ),
              ),
            )),
            Positioned(
                child: Transform.translate(
              offset: const Offset(-35, 0),
              child: AnimatedBuilder(
                animation: animationController,
                child: CardWidget(
                    image: Image.asset(
                  Assets.interstellarPoster,
                  fit: BoxFit.cover,
                )),
                builder: (context, child) => Transform.rotate(
                  angle: animationController.value * 6.03,
                  child: child,
                ),
              ),
            )),
            Positioned(
              child: CardWidget(
                image: Image.asset(
                  Assets.dunePoster,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
