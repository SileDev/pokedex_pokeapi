import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AppBarShape(),
      child: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: 56,
            margin: const EdgeInsets.only(bottom: 32),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Pokédex",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path shape = Path();

    shape.moveTo(0, 0);
    shape.lineTo(size.width, 0);
    shape.lineTo(size.width, size.height - 32);
    shape.lineTo(0, size.height);
    shape.close();

    canvas.drawPath(shape, Paint()..color = Colors.red);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
