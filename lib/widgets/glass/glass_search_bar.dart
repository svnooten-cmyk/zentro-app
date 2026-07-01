import 'package:flutter/material.dart';

import '../../theme/zentro_colors.dart';
import '../../theme/zentro_spacing.dart';
import 'glass_card.dart';

class GlassSearchBar extends StatelessWidget {
  const GlassSearchBar({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.onFilterTap,
  });

  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      height: 58,
      padding: const EdgeInsets.symmetric(
        horizontal: ZentroSpacing.md,
      ),
      borderRadius: ZentroSpacing.radiusXLarge,
      child: Row(
        children: [
          const Icon(Icons.search, size: ZentroSpacing.iconMedium),
          const SizedBox(width: ZentroSpacing.sm),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
          if (onFilterTap != null)
            IconButton(
              onPressed: onFilterTap,
              icon: const Icon(Icons.tune),
              color: ZentroColors.textPrimary,
            ),
        ],
      ),
    );
  }
}