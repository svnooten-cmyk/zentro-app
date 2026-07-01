import 'package:flutter/material.dart';

import 'base_pin.dart';

class ZentroPin extends StatelessWidget {
  const ZentroPin({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BasePin(
      iconAsset: 'assets/icons/zentro_inner_logo.svg',
      onTap: onTap,
    );
  }
}