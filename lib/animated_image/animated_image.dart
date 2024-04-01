import 'package:flutter/material.dart';

import '../utils/assets.dart';

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({super.key});

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with TickerProviderStateMixin {
  late final AnimationController _firstController;
  late final List<AnimationController> _controllers;
  late final List<Animation<double>> _animations;
  late final List<GlobalKey> _cardKeys;

  final ScrollController _scrollController = ScrollController();
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _firstController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..forward();
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_firstController);

    _controllers = List.generate(2, (_) {
      return AnimationController(
        duration: const Duration(seconds: 5),
        vsync: this,
      );
    });
    _animations = _controllers.map((controller) {
      return Tween<double>(begin: 1, end: 1.5).animate(controller);
    }).toList();

    _cardKeys = List.generate(2, (_) => GlobalKey());

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _firstController.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    for (int i = 1; i < _controllers.length; i++) {
      final RenderBox? containerBox =
          _cardKeys[i].currentContext?.findRenderObject() as RenderBox?;
      if (containerBox != null) {
        final containerPosition = containerBox.localToGlobal(Offset.zero).dy;
        final columnHeight = MediaQuery.of(context).size.height;
        final scrollPosition = _scrollController.position.pixels;
        if (containerPosition < scrollPosition + columnHeight) {
          _controllers[i].forward();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff102930),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(2, (index) {
              if (index == 0) {
                return _buildFirstCardWidget();
              } else {
                return _buildCardWidget(index);
              }
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildFirstCardWidget() {
    return Container(
      height: 500.0,
      margin: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: ScaleTransition(
          alignment: Alignment.center,
          scale: _animation,
          child: Image.asset(
            Assets.dunePoster,
          ),
        ),
      ),
    );
  }

  Widget _buildCardWidget(int index) {
    return Container(
      key: _cardKeys[index],
      height: 500.0,
      margin: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: ScaleTransition(
          alignment: Alignment.center,
          scale: _animations[index],
          child: Image.asset(
            Assets.dunePoster,
          ),
        ),
      ),
    );
  }
}
