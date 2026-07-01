import 'package:flutter/material.dart';

import '../pins/callout_pin.dart';
import '../pins/connections_pin.dart';
import '../pins/explore_pin.dart';
import '../pins/profile_pin.dart';
import '../pins/zentro_pin.dart';

class FloatingPinCluster extends StatelessWidget {
  const FloatingPinCluster({
    super.key,
    this.onExplore,
    this.onZentro,
    this.onConnections,
    this.onCallout,
    this.onProfile,
  });

  final VoidCallback? onExplore;
  final VoidCallback? onZentro;
  final VoidCallback? onConnections;
  final VoidCallback? onCallout;
  final VoidCallback? onProfile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
          bottom: 24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ExplorePin(
              onTap: onExplore,
            ),
            ZentroPin(
              onTap: onZentro,
            ),
            ConnectionsPin(
              onTap: onConnections,
            ),
            CalloutPin(
              onTap: onCallout,
            ),
            ProfilePin(
              onTap: onProfile,
            ),
          ],
        ),
      ),
    );
  }
}