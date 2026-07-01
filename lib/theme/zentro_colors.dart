import 'package:flutter/material.dart';

/// ============================================================================
/// ZENTRO COLORS
/// ----------------------------------------------------------------------------
/// All colors used throughout the Zentro application.
/// Never use raw Color() values directly inside widgets.
/// ============================================================================

class ZentroColors {
  ZentroColors._();

  // ===========================================================================
  // Brand
  // ===========================================================================

  static const Color primary = Color(0xFF2F80ED);
  static const Color secondary = Color(0xFF56CCF2);

  // ===========================================================================
  // Backgrounds
  // ===========================================================================

  static const Color background = Color(0xFFF8F9FB);
  static const Color backgroundDark = Color(0xFF111827);

  // ===========================================================================
  // Glass
  // ===========================================================================

  static const Color glass = Color(0x66FFFFFF);
  static const Color glassBorder = Color(0x33FFFFFF);

  // ===========================================================================
  // Text
  // ===========================================================================

  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF707070);
  static const Color textLight = Colors.white;

  // ===========================================================================
  // Status
  // ===========================================================================

  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFF2994A);
  static const Color error = Color(0xFFEB5757);

  // ===========================================================================
  // Pins
  // ===========================================================================

  static const Color explorePin = Color(0xFF2F80ED);
  static const Color zentroPin = Color(0xFF2F80ED);
  static const Color connectionPin = Color(0xFF27AE60);
  static const Color calloutPin = Color(0xFFF2994A);
  static const Color profilePin = Color(0xFF9B51E0);
  static const Color customPin = Color(0xFF4F4F4F);
}