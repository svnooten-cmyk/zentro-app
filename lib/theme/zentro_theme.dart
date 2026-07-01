import 'package:flutter/material.dart';

import 'zentro_colors.dart';
import 'zentro_typography.dart';


/// ============================================================================
/// ZENTRO THEME
/// ----------------------------------------------------------------------------
/// Main app theme configuration.
/// ============================================================================

class ZentroTheme {
  ZentroTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: ZentroTypography.fontFamily,
      scaffoldBackgroundColor: ZentroColors.background,
      colorScheme: const ColorScheme.light(
        primary: ZentroColors.primary,
        secondary: ZentroColors.secondary,
        surface: Colors.white,
        error: ZentroColors.error,
      ),
      textTheme: const TextTheme(
        displayLarge: ZentroTypography.headingXL,
        displayMedium: ZentroTypography.headingLarge,
        headlineMedium: ZentroTypography.headingMedium,
        titleLarge: ZentroTypography.title,
        bodyLarge: ZentroTypography.bodyLarge,
        bodyMedium: ZentroTypography.body,
        bodySmall: ZentroTypography.bodySmall,
        labelLarge: ZentroTypography.button,
        labelSmall: ZentroTypography.label,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: ZentroTypography.fontFamily,
      scaffoldBackgroundColor: ZentroColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: ZentroColors.primary,
        secondary: ZentroColors.secondary,
        surface: ZentroColors.backgroundDark,
        error: ZentroColors.error,
      ),
      textTheme: const TextTheme(
        displayLarge: ZentroTypography.headingXL,
        displayMedium: ZentroTypography.headingLarge,
        headlineMedium: ZentroTypography.headingMedium,
        titleLarge: ZentroTypography.title,
        bodyLarge: ZentroTypography.bodyLarge,
        bodyMedium: ZentroTypography.body,
        bodySmall: ZentroTypography.bodySmall,
        labelLarge: ZentroTypography.button,
        labelSmall: ZentroTypography.label,
      ),
    );
  }
}