import 'package:flutter/material.dart';

class PokemonCardShape extends CustomPainter {
  final Color fillColor;

  PokemonCardShape({required this.fillColor});
  @override
  void paint(Canvas canvas, Size size) {
    Path shape = Path();

    shape.moveTo(32, 32);
    shape.lineTo(size.width, 0);
    shape.lineTo(size.width - 32, size.height);
    shape.lineTo(64, size.height - 32);
    shape.close();

    canvas.drawPath(shape, Paint()..color = fillColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
