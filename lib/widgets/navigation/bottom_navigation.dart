import 'dart:ui';

import 'package:flutter/material.dart';

import '../pins/callout_pin.dart';
import '../pins/connections_pin.dart';
import '../pins/explore_pin.dart';
import '../pins/profile_pin.dart';
import '../pins/zentro_pin.dart';

class ZentroBottomNavigation extends StatelessWidget {
  const ZentroBottomNavigation({
    super.key,
    this.onExploreTap,
    this.onZentroTap,
    this.onConnectionsTap,
    this.onCalloutTap,
    this.onProfileTap,
  });

  final VoidCallback? onExploreTap;
  final VoidCallback? onZentroTap;
  final VoidCallback? onConnectionsTap;
  final VoidCallback? onCalloutTap;
  final VoidCallback? onProfileTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 18),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(38),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.22),
                borderRadius: BorderRadius.circular(38),
                border: Border.all(
                  color: Colors.white.withOpacity(0.42),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    blurRadius: 28,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ExplorePin(onTap: onExploreTap),
                  ZentroPin(onTap: onZentroTap),
                  ConnectionsPin(onTap: onConnectionsTap),
                  CalloutPin(onTap: onCalloutTap),
                  ProfilePin(onTap: onProfileTap),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}