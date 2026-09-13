import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/core/theme/app_colors.dart';
import 'package:wound_insight_app/core/theme/app_typography.dart';
import 'package:wound_insight_app/widgets/loading_view.dart';

class AuthenticatedImageView extends StatelessWidget {
  final AsyncValue<Uint8List> asyncBytes;
  final double maxHeight;
  final String loadingMessage;
  final String errorMessage;
  final VoidCallback? onRetry;

  const AuthenticatedImageView({
    super.key,
    required this.asyncBytes,
    this.maxHeight = 360,
    this.loadingMessage = 'Loading image...',
    this.errorMessage = 'Unable to display image.',
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return asyncBytes.when(
      data: (bytes) {
        if (bytes.isEmpty) {
          return _buildErrorState(context, isDark, 'No image data received.');
        }
        return Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppColors.surfaceDark : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
              ),
              constraints: BoxConstraints(maxHeight: maxHeight),
              child: Image.memory(
                bytes,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    _buildErrorState(context, isDark, 'Error decoding image data.'),
              ),
            ),
          ),
        );
      },
      loading: () => Container(
        height: 200,
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark.withOpacity(0.5) : const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: LoadingView(message: loadingMessage),
        ),
      ),
      error: (err, _) => _buildErrorState(context, isDark, errorMessage),
    );
  }

  Widget _buildErrorState(BuildContext context, bool isDark, String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(0.04) : Colors.black.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.broken_image_outlined,
              size: 32,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTypography.bodySmall.copyWith(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 10),
              TextButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded, size: 16),
                label: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
