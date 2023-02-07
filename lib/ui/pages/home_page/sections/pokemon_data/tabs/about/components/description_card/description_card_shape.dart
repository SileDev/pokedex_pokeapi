import 'package:flutter/material.dart';

class DescriptionCardShape extends CustomPainter {
  final Color fillColor;

  DescriptionCardShape({required this.fillColor});
  @override
  void paint(Canvas canvas, Size size) {
    Path shape = Path();

    shape.moveTo(8, 0);
    shape.lineTo(size.width, 0);
    shape.lineTo(size.width, size.height - 8);
    shape.lineTo(size.width - 8, size.height);
    shape.lineTo(0, size.height);
    shape.lineTo(0, 8);
    shape.close();

    canvas.drawPath(shape, Paint()..color = fillColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
