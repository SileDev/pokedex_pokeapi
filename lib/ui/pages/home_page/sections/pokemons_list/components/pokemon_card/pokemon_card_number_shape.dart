import 'package:flutter/material.dart';

class PokemonCardNumberShape extends CustomPainter {
  final Color fillColor;

  PokemonCardNumberShape({required this.fillColor});
  @override
  void paint(Canvas canvas, Size size) {
    Path shape = Path();

    shape.moveTo(8, 0);
    shape.lineTo(size.width, 8);
    shape.lineTo(size.width - 8, size.height);
    shape.lineTo(0, size.height - 8);
    shape.close();

    canvas.drawPath(shape, Paint()..color = fillColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
