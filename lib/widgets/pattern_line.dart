import 'package:flutter/material.dart';

class PatternLine extends StatefulWidget {
  const PatternLine({super.key, required this.lineCoord});

  final List<int> lineCoord;
  @override
  State<PatternLine> createState() => _PatternLineState();
}

class _PatternLineState extends State<PatternLine>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
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
      builder: (context, child) => CustomPaint(
        painter: PatternMatchLine(widget.lineCoord, animationController.value),
      ),
    );
  }
}

class PatternMatchLine extends CustomPainter {
  PatternMatchLine(this.coord, this.progress);

  final List<int> coord;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    print("Coordinates are: $coord");
    final strokeWidth = size.width / 15.0;
    final backgroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double x1 = (size.width / 6 + (size.width / 3) * coord[0]);
    double y1 = (size.width / 6 + (size.width / 3) * coord[1]);
    double x2 = (size.width / 6 + (size.width / 3) * coord[2]) * progress;
    double y2 = (size.width / 6 + (size.width / 3) * coord[3]) * progress;

    canvas.drawLine(Offset(x1, y1), Offset(x2, y2), backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
