import 'package:flutter/material.dart';

class Grid extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 7.0;

    final backgroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(size.width * 0.33, 0),
        Offset(size.width * 0.33, size.height), backgroundPaint);

    canvas.drawLine(Offset(size.width * 0.67, 0),
        Offset(size.width * 0.67, size.height), backgroundPaint);

    canvas.drawLine(Offset(0, size.height * 0.33),
        Offset(size.width, size.height * 0.33), backgroundPaint);

    canvas.drawLine(Offset(0, size.height * 0.67),
        Offset(size.width, size.height * 0.67), backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
