import 'package:flutter/material.dart';

import 'base_pin.dart';

class ConnectionsPin extends StatelessWidget {
  const ConnectionsPin({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BasePin(
      iconAsset: 'assets/icons/connections_icon.svg',
      onTap: onTap,
    );
  }
}