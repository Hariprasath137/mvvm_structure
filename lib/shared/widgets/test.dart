import 'package:flutter/material.dart';

class ECGPainter extends CustomPainter {
  final double animationValue;

  ECGPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Color(0XFF7E8A8C)
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    final path = Path();
    double width = size.width;
    double height = size.height / 2;
    double speed = width * animationValue;

    path.moveTo(-speed, height);
    for (double x = -speed; x <= width; x += 5) {
      double position = (x + speed) % 100;
      double y = height;
      if (position < 40) {
        y = height;
      } else if (position == 45) {
        y += 15;
      } else if (position == 50) {
        y -= 30;
      } else if (position == 55) {
        y += 20;
      } else if (position < 100) {
        y = height;
      } else if (position == 120) {
        y -= 7;
      }
      path.lineTo(x, y);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
