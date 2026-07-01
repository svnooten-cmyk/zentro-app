import 'package:flutter/material.dart';

import 'base_pin.dart';

class ProfilePin extends StatelessWidget {
  const ProfilePin({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BasePin(
      iconAsset: 'assets/icons/profile_icon.svg',
      onTap: onTap,
    );
  }
}