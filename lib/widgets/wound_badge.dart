import 'package:flutter/material.dart';
import 'package:wound_insight_app/core/theme/app_colors.dart';
import 'package:wound_insight_app/core/theme/app_typography.dart';

class WoundBadge extends StatelessWidget {
  final String label;
  final Color? color;
  final bool isSeverity;

  const WoundBadge({
    super.key,
    required this.label,
    this.color,
    this.isSeverity = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? (isSeverity ? AppColors.getSeverityColor(label) : AppColors.primary);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: effectiveColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: effectiveColor.withOpacity(0.35),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall.copyWith(
          color: effectiveColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
