import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/core/theme/app_colors.dart';
import 'package:wound_insight_app/core/theme/app_typography.dart';
import 'package:wound_insight_app/core/utils/date_formatting.dart';
import 'package:wound_insight_app/models/analysis_result.dart';
import 'package:wound_insight_app/providers/analysis_providers.dart';
import 'package:wound_insight_app/widgets/wound_badge.dart';
import 'package:wound_insight_app/widgets/authenticated_image_view.dart';

class ReportScreen extends ConsumerWidget {
  final String analysisId;
  final AnalysisResult? analysisResult;

  const ReportScreen({
    super.key,
    required this.analysisId,
    this.analysisResult,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportBytes = ref.watch(reportImageBytesProvider(analysisId));
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Diagnostic Report'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            tooltip: 'Export Report (Coming Soon)',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Report export to PDF / Hospital EHR is coming soon.'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Report Header Sheet
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDark ? AppColors.surfaceDark : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'WoundInsight AI Analysis',
                              style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Automated Diagnostic & Morphometric Assessment',
                              style: AppTypography.bodySmall.copyWith(
                                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (analysisResult != null) ...[
                        const SizedBox(width: 8),
                        WoundBadge(label: analysisResult!.severity.severityGrade, isSeverity: true),
                      ],
                    ],
                  ),
                  const Divider(height: 24),
                  if (analysisResult != null) ...[
                    _metaRow('Timestamp', DateFormatting.formatIso(analysisResult!.timestamp), isDark),
                    _metaRow('Report UUID', analysisResult!.analysisId, isDark),
                    _metaRow('Source Image', analysisResult!.originalFilename, isDark),
                    _metaRow(
                      'AI Classification',
                      '${analysisResult!.etiology.predictedType} (${analysisResult!.etiology.confidence.toStringAsFixed(1)}%)',
                      isDark,
                    ),
                    _metaRow(
                      'Estimated Area',
                      '${analysisResult!.wound.areaCm2} cm²',
                      isDark,
                    ),
                    _metaRow(
                      'Estimated Perimeter',
                      '${analysisResult!.wound.perimeterMm} mm',
                      isDark,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Diagnostic Report Figure Banner
            const Text(
              '6-Panel AI Diagnostic Figure',
              style: AppTypography.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'High-resolution multi-modal figure rendered directly by the deep learning pipeline.',
              style: AppTypography.bodySmall.copyWith(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 12),

            // Streamed Report PNG from /report via authenticated Dio client
            AuthenticatedImageView(
              asyncBytes: reportBytes,
              maxHeight: 520,
              loadingMessage: 'Streaming multi-panel diagnostic report figure...',
              errorMessage: '6-panel diagnostic report figure is currently unavailable.',
              onRetry: () => ref.refresh(reportImageBytesProvider(analysisId)),
              allowZoom: true,
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Tap image to view full size',
                style: AppTypography.labelSmall.copyWith(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Recommendation Section
            if (analysisResult != null) ...[
              const Text('AI Care Protocol Recommendation', style: AppTypography.titleMedium),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.surfaceDark : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                ),
                child: Text(
                  analysisResult!.severity.recommendedAction,
                  style: AppTypography.bodyMedium.copyWith(height: 1.5),
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Academic Prototype Disclaimer
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isDark ? Colors.white.withOpacity(0.04) : Colors.black.withOpacity(0.03),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 18,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Notice: This AI diagnostic report is generated by an academic multi-task deep learning model for research and decision-support purposes. It does not constitute a certified independent clinical diagnosis.',
                      style: AppTypography.labelSmall.copyWith(
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Export CTA
            OutlinedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Report export to PDF / Hospital EHR is coming soon.'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon: const Icon(Icons.download_rounded, size: 18),
              label: const Text('Export Report PDF (Coming Soon)'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _metaRow(String label, String value, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: AppTypography.labelSmall.copyWith(
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
