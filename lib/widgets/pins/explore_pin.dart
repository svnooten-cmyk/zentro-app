import 'package:flutter/material.dart';

import 'base_pin.dart';

class ExplorePin extends StatelessWidget {
  const ExplorePin({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BasePin(
      iconAsset: 'assets/icons/world_globe_icon.svg',
      onTap: onTap,
    );
  }
}