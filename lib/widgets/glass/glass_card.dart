import 'dart:ui';

import 'package:flutter/material.dart';

import '../../theme/zentro_colors.dart';
import '../../theme/zentro_constants.dart';
import '../../theme/zentro_spacing.dart';

/// ============================================================================
/// ZENTRO GLASS CARD
/// ----------------------------------------------------------------------------
/// Base glassmorphism container used throughout Zentro.
/// The world should stay visible behind the interface.
/// ============================================================================

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.opacity,
    this.blur,
    this.onTap,
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final double? opacity;
  final double? blur;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? ZentroSpacing.radiusLarge;
    final glassOpacity = opacity ?? ZentroConstants.glassOpacity;
    final glassBlur = blur ?? ZentroConstants.glassBlur;

    final card = ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: glassBlur,
          sigmaY: glassBlur,
        ),
        child: Container(
          width: width,
          height: height,
          margin: margin,
          padding: padding ?? const EdgeInsets.all(ZentroSpacing.md),
          decoration: BoxDecoration(
            color: ZentroColors.glass.withOpacity(glassOpacity),
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: ZentroColors.glassBorder,
              width: ZentroConstants.glassBorderWidth,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.14),
                blurRadius: ZentroConstants.shadowBlur,
                offset: const Offset(0, ZentroConstants.shadowOffset),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );

    if (onTap == null) return card;

    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: onTap,
      child: card,
    );
  }
}