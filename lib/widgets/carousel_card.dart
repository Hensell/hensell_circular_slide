import 'package:flutter/material.dart';
import 'dart:math';

class CarouselCard extends StatelessWidget {
  final int index;
  final double offset;

  const CarouselCard({super.key, required this.index, required this.offset});

  @override
  Widget build(BuildContext context) {
    final clampedOffset = offset.clamp(-1.0, 1.0);

    final scale = 1 - (clampedOffset.abs() * 0.3);

    final rotationZ = clampedOffset * pi / 8;

    return Transform(
      alignment: Alignment.center,
      transform:
          Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..translate(0.0, clampedOffset.abs() * -70)
            ..rotateZ(rotationZ)
            ..scale(scale),
      child: Image.asset('assets/images/card${index + 1}.png'),
    );
  }
}
