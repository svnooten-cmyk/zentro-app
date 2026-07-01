import 'package:flutter/material.dart';

import '../widgets/map/journey_layer.dart';
import '../widgets/navigation/floating_pin_cluster.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          // Tijdelijke kaartachtergrond
          Positioned.fill(
            child: _MapBackground(),
          ),

          // Journey line
          Positioned.fill(
            child: JourneyLayer(),
          ),

          // Navigatiepins
          Positioned(
            left: 0,
            right: 0,
            bottom: 24,
            child: FloatingPinCluster(),
          ),
        ],
      ),
    );
  }
}

class _MapBackground extends StatelessWidget {
  const _MapBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEAF3FF),
    );
  }
}