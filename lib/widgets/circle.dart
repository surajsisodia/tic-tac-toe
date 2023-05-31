import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Circle extends ConsumerStatefulWidget {
  Circle({super.key});

  @override
  ConsumerState<Circle> createState() => _CircleState();
}

class _CircleState extends ConsumerState<Circle> with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        lowerBound: 0.0,
        upperBound: 2 * pi,
        vsync: this,
        duration: Duration(milliseconds: 500));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      animationController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return CustomPaint(
          painter: CircleCustomPainter(angle: animationController.value),
        );
      },
    );
  }
}

class CircleCustomPainter extends CustomPainter {
  final double angle;

  CircleCustomPainter({required this.angle});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width / 15.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 0, angle,
        false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
