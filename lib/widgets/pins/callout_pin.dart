import 'package:flutter/material.dart';

import 'base_pin.dart';

class CalloutPin extends StatelessWidget {
  const CalloutPin({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BasePin(
      iconAsset: 'assets/icons/callout_exclamation_icon.svg',
      onTap: onTap,
    );
  }
}