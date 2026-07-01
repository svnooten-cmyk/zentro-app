import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' hide Path;

import '../pins/explore_pin.dart';
import '../pins/zentro_pin.dart';
import '../pins/connections_pin.dart';
import '../pins/callout_pin.dart';
import '../pins/profile_pin.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(8.3405, 115.0920),
            initialZoom: 3.8,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.zentro.app',
            ),
          ],
        ),

        const Positioned.fill(
          child: _JourneyLine(),
        ),

        const Positioned(
          left: 170,
          top: 245,
          child: ProfilePin(),
        ),

        const Positioned(
          left: 18,
          right: 18,
          bottom: 18,
          child: _BottomPins(),
        ),
      ],
    );
  }
}

class _BottomPins extends StatelessWidget {
  const _BottomPins();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ExplorePin(),
        ZentroPin(),
        ConnectionsPin(),
        CalloutPin(),
        ProfilePin(),
      ],
    );
  }
}

class _JourneyLine extends StatelessWidget {
  const _JourneyLine();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _JourneyLinePainter(),
    );
  }
}

class _JourneyLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF22D3EE).withOpacity(0.85)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(size.width * 0.42, size.height * 0.32)
      ..quadraticBezierTo(
        size.width * 0.52,
        size.height * 0.45,
        size.width * 0.50,
        size.height * 0.56,
      )
      ..quadraticBezierTo(
        size.width * 0.48,
        size.height * 0.68,
        size.width * 0.61,
        size.height * 0.82,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}