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
  List<String> imageList = [
    Assets.dunePoster,
    Assets.inceptionPoster,
    Assets.interstellarPoster,
    Assets.madMaxPoster
  ];
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
            ..._buildPositionedWidgets(imageList),
          ],
        ),
      ),
    );
  }

  List<Positioned> _buildPositionedWidgets(List<String> imageList) {
    List<Positioned> positionedWidgets = [];

    // Add widgets for indices other than 0
    for (int index = 1; index < imageList.length; index++) {
      final isEven = index.isEven;
      final offsetX = isEven ? 35.0 : -35.0;
      final angle = isEven ? -6.03 : 6.03;

      positionedWidgets.add(
        Positioned(
          child: Transform.translate(
            offset: Offset(offsetX, 0),
            child: AnimatedBuilder(
              animation: animationController,
              child: CardWidget(
                image: Image.asset(
                  imageList[index],
                  fit: BoxFit.cover,
                ),
              ),
              builder: (context, child) => Transform.rotate(
                angle: animationController.value * angle,
                child: child,
              ),
            ),
          ),
        ),
      );
    }

    // Add widget for index 0 (on top of the stack)
    positionedWidgets.add(
      Positioned(
        child: Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            print(direction.name);
            if (imageList.length > 1) {
              setState(() {
                imageList.removeAt(0);
              });
            }
          },
          child: CardWidget(
            image: Image.asset(
              imageList[0],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );

    return positionedWidgets;
  }
}
