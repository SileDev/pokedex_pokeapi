import 'package:flutter/material.dart';

class PokemonDataTemplateShape extends CustomPainter {
  final Color fillColor;

  PokemonDataTemplateShape({
    required this.fillColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path shape = Path();

    shape.moveTo(64, 0);
    shape.lineTo(size.width, 0);
    shape.lineTo(size.width, size.height);
    shape.lineTo(0, size.height);
    shape.close();

    canvas.drawPath(shape, Paint()..color = fillColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
