/// ============================================================================
/// ZENTRO CONSTANTS
/// ----------------------------------------------------------------------------
/// Global UI constants used throughout the application.
/// ============================================================================

class ZentroConstants {
  ZentroConstants._();

  // Animation Durations

  static const fastAnimation = Duration(milliseconds: 150);
  static const normalAnimation = Duration(milliseconds: 250);
  static const slowAnimation = Duration(milliseconds: 400);

  // Glass

  static const double glassBlur = 20;
  static const double glassOpacity = 0.20;
  static const double glassBorderWidth = 1.0;

  // Shadows

  static const double shadowBlur = 18;
  static const double shadowOffset = 8;

  // Map

  static const double defaultZoom = 3.0;
  static const double maxZoom = 18.0;
  static const double minZoom = 2.0;
}