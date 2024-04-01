import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class CardWidget extends StatelessWidget {
  final Image image;
  const CardWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _updatePaletteGenerator(image),
        builder: (context, data) {
          return Container(
            height: 300,
            width: 180,
            color: data.data?.dominantColor?.color,
            child: image,
          );
        });
  }

  Future<PaletteGenerator> _updatePaletteGenerator(Image image) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      image.image,
    );
    paletteGenerator.dominantColor;
    return paletteGenerator;
  }
}
