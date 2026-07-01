import 'package:flutter/material.dart';

/// ============================================================================
/// ZENTRO TYPOGRAPHY
/// ----------------------------------------------------------------------------
/// Text styles used throughout Zentro.
/// ============================================================================

class ZentroTypography {
  ZentroTypography._();

  static const String fontFamily = 'Inter';

  static const TextStyle headingXL = TextStyle(
    fontFamily: fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w800,
    height: 1.1,
  );

  static const TextStyle headingLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w800,
    height: 1.15,
  );

  static const TextStyle headingMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.45,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.45,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.35,
  );

  static const TextStyle label = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );
}