import 'package:flutter/material.dart';

class JourneyLayer extends StatelessWidget {
  const JourneyLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        size: Size.infinite,
        painter: JourneyPainter(),
      ),
    );
  }
}

class JourneyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pastPaint = Paint()
      ..color = const Color(0xFF2F9BFF)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final futurePaint = Paint()
      ..color = const Color(0x882F9BFF)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final pastPath = Path()
      ..moveTo(size.width * 0.08, size.height * 0.82)
      ..cubicTo(
        size.width * 0.18,
        size.height * 0.52,
        size.width * 0.42,
        size.height * 0.63,
        size.width * 0.50,
        size.height * 0.48,
      );

    canvas.drawPath(pastPath, pastPaint);

    final futurePath = Path()
      ..moveTo(size.width * 0.50, size.height * 0.48)
      ..cubicTo(
        size.width * 0.60,
        size.height * 0.34,
        size.width * 0.80,
        size.height * 0.42,
        size.width * 0.92,
        size.height * 0.12,
      );

    const dash = 14.0;
    const gap = 10.0;

    for (final metric in futurePath.computeMetrics()) {
      double distance = 0;

      while (distance < metric.length) {
        final path = metric.extractPath(
          distance,
          distance + dash,
        );

        canvas.drawPath(path, futurePaint);

        distance += dash + gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}