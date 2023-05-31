import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cross extends ConsumerStatefulWidget {
  const Cross({super.key});

  @override
  ConsumerState<Cross> createState() => _CrossState();
}

class _CrossState extends ConsumerState<Cross>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        lowerBound: 0.0,
        upperBound: 200,
        vsync: this,
        duration: Duration(milliseconds: 500));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (animationController.value == animationController.upperBound)
        animationController.reverse();
      else
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
      builder: (context, child) => CustomPaint(
        painter: CrossCustomPainter(progress: animationController.value),
      ),
    );
  }
}

class CrossCustomPainter extends CustomPainter {
  final double progress;

  CrossCustomPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width / 15.0;

    final backgroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    if (progress > 0)
      canvas.drawLine(
          Offset(0, 0),
          Offset(min(100, progress) / 100 * size.width,
              min(progress, 100) / 100 * size.width),
          backgroundPaint);

    if (progress > 100)
      canvas.drawLine(
          Offset(size.width, 0),
          Offset(size.width - (progress - 100) / 100 * size.width,
              (progress - 100) / 100 * size.width),
          backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
