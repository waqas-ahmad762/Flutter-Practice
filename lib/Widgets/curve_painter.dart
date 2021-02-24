import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.moveTo(0, size.height / 1.9);
    path.quadraticBezierTo(
        size.width / 2, size.height / 1.5, size.width, size.height / 1.9);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    paint.color = Color(0x4D1DC3A7);
    canvas.drawPath(path, paint);

    path = Path();
    path.moveTo(0, size.height / 2.0);
    path.quadraticBezierTo(
        size.width / 2, size.height / 1.5, size.width, size.height / 2.0);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    paint.color = Color(0x4D1DC3A7);
    canvas.drawPath(path, paint);

    path = Path();
    path.moveTo(0, size.height / 2.2);
    path.quadraticBezierTo(
        size.width / 2, size.height / 1.5, size.width, size.height / 2.2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    paint.color = Color(0xFF1DC3A7);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
