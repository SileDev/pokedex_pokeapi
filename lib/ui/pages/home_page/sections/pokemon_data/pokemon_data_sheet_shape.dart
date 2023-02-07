import 'package:flutter/material.dart';

class PokemonDataSheetShape extends CustomPainter {
  final Color fillColor;
  final bool fixed;

  PokemonDataSheetShape({
    required this.fillColor,
    required this.fixed,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path shape = Path();

    shape.moveTo(0, 64);
    shape.lineTo(size.width, 0);
    shape.lineTo(!fixed ? size.width - 16 : size.width, size.height);
    shape.lineTo(16, size.height);
    shape.close();

    canvas.drawPath(shape, Paint()..color = fillColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
