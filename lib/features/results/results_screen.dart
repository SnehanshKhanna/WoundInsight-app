import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/core/theme/app_colors.dart';
import 'package:wound_insight_app/core/theme/app_typography.dart';
import 'package:wound_insight_app/core/utils/date_formatting.dart';
import 'package:wound_insight_app/models/analysis_result.dart';
import 'package:wound_insight_app/providers/analysis_providers.dart';
import 'package:wound_insight_app/features/report/report_screen.dart';
import 'package:wound_insight_app/widgets/wound_badge.dart';
import 'package:wound_insight_app/widgets/loading_view.dart';
import 'package:wound_insight_app/widgets/error_view.dart';
import 'package:wound_insight_app/widgets/authenticated_image_view.dart';

class ResultsScreen extends ConsumerWidget {
  final String analysisId;
  final AnalysisResult? initialData;

  const ResultsScreen({
    super.key,
    required this.analysisId,
    this.initialData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initialData != null) {
      return _buildContent(context, ref, initialData!);
    }

    final asyncDetail = ref.watch(analysisDetailProvider(analysisId));

    return asyncDetail.when(
      loading: () => Scaffold(
        appBar: AppBar(
          title: const Text('AI Analysis Results'),
        ),
        body: const LoadingView(message: 'Loading diagnostic record...'),
      ),
      error: (e, _) => Scaffold(
        appBar: AppBar(
          title: const Text('AI Analysis Results'),
        ),
        body: ErrorView(
          message: e.toString(),
          onRetry: () => ref.refresh(analysisDetailProvider(analysisId)),
        ),
      ),
      data: (result) => _buildContent(context, ref, result),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, AnalysisResult data) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isNoLesion = !data.wound.detected ||
        data.severity.severityGrade.toLowerCase().contains('no active lesion');

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Analysis Results'),
        actions: [
          IconButton(
            icon: const Icon(Icons.description_outlined),
            tooltip: 'View AI Diagnostic Report',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ReportScreen(analysisId: data.analysisId, analysisResult: data),
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
            // Metadata banner
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormatting.formatIso(data.timestamp),
                  style: AppTypography.labelSmall.copyWith(
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
                Text(
                  'ID: ${data.analysisId.substring(0, 8)}',
                  style: AppTypography.labelSmall.copyWith(
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Section 1: Analysis Summary
            _buildSummaryCard(context, data, isDark),
            const SizedBox(height: 16),

            // Section 2 - 4 OR "No Active Lesion Detected" state
            if (isNoLesion) ...[
              _buildNoLesionCard(context, data, isDark),
              const SizedBox(height: 16),
            ] else ...[
              // Section 2: Wound Measurements
              _buildMeasurementsCard(context, data, isDark),
              const SizedBox(height: 16),

              // Section 3: Tissue Composition
              _buildTissueCompositionCard(context, data, isDark),
              const SizedBox(height: 16),

              // Section 4: Treatment Recommendation
              _buildTreatmentCard(context, data, isDark),
              const SizedBox(height: 16),
            ],

            // Section 5: Explainability (Grad-CAM)
            if (data.explainability != null && data.explainability!.available) ...[
              _buildExplainabilityCard(context, ref, data, isDark),
              const SizedBox(height: 16),
            ],

            // Section 6: Original Photo
            _buildOriginalPhotoCard(context, ref, data, isDark),
            const SizedBox(height: 20),

            // Section 7: View Full Diagnostic Report CTA
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ReportScreen(analysisId: data.analysisId, analysisResult: data),
                  ),
                );
              },
              icon: const Icon(Icons.assignment_outlined, size: 20),
              label: const Text('View Full AI Diagnostic Report'),
            ),
            const SizedBox(height: 16),

            // Academic Disclaimer
            Center(
              child: Text(
                data.academicNotice ??
                    'Academic prototype. Not certified for standalone clinical diagnostic decisions.',
                textAlign: TextAlign.center,
                style: AppTypography.labelSmall.copyWith(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, AnalysisResult data, bool isDark) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text('Diagnostic Assessment', style: AppTypography.titleMedium),
                ),
                const SizedBox(width: 8),
                WoundBadge(label: data.severity.severityGrade, isSeverity: true),
              ],
            ),
            const Divider(height: 24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Model Classification', style: AppTypography.labelSmall),
                      const SizedBox(height: 4),
                      Text(
                        data.etiology.predictedType,
                        style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Model Confidence', style: AppTypography.labelSmall),
                    const SizedBox(height: 4),
                    Text(
                      '${data.etiology.confidence.toStringAsFixed(1)}%',
                      style: AppTypography.titleLarge.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (data.uncertainty.requiresClinicianReview) ...[
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.severityModerate.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.severityModerate.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline_rounded, size: 20, color: AppColors.severityModerate),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Clinician review recommended due to ambiguous boundary or classification uncertainty.',
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.severityModerate,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildNoLesionCard(BuildContext context, AnalysisResult data, bool isDark) {
    return Card(
      color: isDark ? AppColors.surfaceDark : const Color(0xFFF0F9FF),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.severityNoLesion.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.verified_outlined,
                size: 38,
                color: AppColors.severityNoLesion,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'No Active Lesion Detected',
              style: AppTypography.titleLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.severityNoLesion,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'No active open wound was identified in this image. If you have concerns, symptoms, or suspect a skin injury, please consult a healthcare professional for clinical evaluation.',
              textAlign: TextAlign.center,
              style: AppTypography.bodySmall.copyWith(
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeasurementsCard(BuildContext context, AnalysisResult data, bool isDark) {
    final m = data.wound;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Wound Morphometrics', style: AppTypography.titleMedium),
            const SizedBox(height: 4),
            Text(
              'Estimated dimensions based on 0.15 mm/pixel spatial calibration heuristic.',
              style: AppTypography.bodySmall.copyWith(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
            const Divider(height: 24),
            Row(
              children: [
                Expanded(
                  child: _metricBox(
                    context,
                    label: 'Estimated Area',
                    value: '${m.areaCm2.toStringAsFixed(2)} cm²',
                    icon: Icons.aspect_ratio_rounded,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _metricBox(
                    context,
                    label: 'Estimated Perimeter',
                    value: '${m.perimeterMm.toStringAsFixed(1)} mm',
                    icon: Icons.linear_scale_rounded,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _metricBox(
                    context,
                    label: 'Circularity Quotient',
                    value: m.circularity.toStringAsFixed(3),
                    icon: Icons.circle_outlined,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _metricBox(
                    context,
                    label: 'Contour Regularity',
                    value: m.isIrregular ? 'Irregular' : 'Regular',
                    icon: Icons.grain_rounded,
                    accentColor: m.isIrregular ? AppColors.severityModerate : AppColors.severityLow,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _metricBox(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
    Color? accentColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.backgroundDark : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: accentColor ?? AppColors.primary),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: AppTypography.labelSmall.copyWith(
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    fontSize: 11,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: AppTypography.titleMedium.copyWith(
              color: accentColor ?? (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTissueCompositionCard(BuildContext context, AnalysisResult data, bool isDark) {
    final t = data.tissue;
    final gran = t.granulationPercent;
    final fib = t.fibrinSloughPercent;
    final cal = t.callusPercent;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tissue Composition Breakdown', style: AppTypography.titleMedium),
            const SizedBox(height: 4),
            Text(
              'Supervised multi-class segmentation of segmented wound bed.',
              style: AppTypography.bodySmall.copyWith(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 16),

            // Horizontal distribution bar
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 18,
                child: Row(
                  children: [
                    if (gran > 0)
                      Expanded(
                        flex: (gran * 10).round(),
                        child: Container(color: AppColors.tissueGranulation),
                      ),
                    if (fib > 0)
                      Expanded(
                        flex: (fib * 10).round(),
                        child: Container(color: AppColors.tissueFibrinSlough),
                      ),
                    if (cal > 0)
                      Expanded(
                        flex: (cal * 10).round(),
                        child: Container(color: AppColors.tissueCallus),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Legend rows
            _tissueLegendRow('Granulation Tissue (Viable)', gran, AppColors.tissueGranulation),
            const SizedBox(height: 6),
            _tissueLegendRow('Fibrin / Slough (Devitalized)', fib, AppColors.tissueFibrinSlough),
            const SizedBox(height: 6),
            _tissueLegendRow('Callus / Hyperkeratotic', cal, AppColors.tissueCallus),
          ],
        ),
      ),
    );
  }

  Widget _tissueLegendRow(String title, double percentage, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(title, style: AppTypography.bodySmall),
        ),
        Text(
          '${percentage.toStringAsFixed(1)}%',
          style: AppTypography.labelSmall.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget _buildTreatmentCard(BuildContext context, AnalysisResult data, bool isDark) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.shield_outlined, color: AppColors.primary, size: 22),
                SizedBox(width: 8),
                Text('AI System Recommendation', style: AppTypography.titleMedium),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isDark ? AppColors.backgroundDark : const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
              ),
              child: Text(
                data.severity.recommendedAction,
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                  height: 1.45,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Notice: This is not a substitute for professional medical advice or certified diagnostic guidance.',
              style: AppTypography.labelSmall.copyWith(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExplainabilityCard(
    BuildContext context,
    WidgetRef ref,
    AnalysisResult data,
    bool isDark,
  ) {
    final expl = data.explainability!;
    final gradCamBytes = ref.watch(gradCamBytesProvider(data.analysisId));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.visibility_rounded, color: AppColors.primary, size: 22),
                SizedBox(width: 8),
                Text('Model Attention Visualization', style: AppTypography.titleMedium),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Grad-CAM attribution heatmap demonstrating image regions that influenced the dual-branch classifier.',
              style: AppTypography.bodySmall.copyWith(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 14),
            AuthenticatedImageView(
              asyncBytes: gradCamBytes,
              maxHeight: 320,
              loadingMessage: 'Rendering Grad-CAM attribution heatmap...',
              errorMessage: 'Grad-CAM visualization currently unavailable for this scan.',
              onRetry: () => ref.refresh(gradCamBytesProvider(data.analysisId)),
            ),
            const SizedBox(height: 10),
            Text(
              expl.academicNotice ??
                  'Attribution visualization indicates model feature activation patterns, not clinical causality.',
              style: AppTypography.labelSmall.copyWith(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOriginalPhotoCard(
    BuildContext context,
    WidgetRef ref,
    AnalysisResult data,
    bool isDark,
  ) {
    final photoBytes = ref.watch(originalImageBytesProvider(data.analysisId));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Original Photographic Capture', style: AppTypography.titleMedium),
            const SizedBox(height: 4),
            Text(
              'Original uploaded file: ${data.originalFilename}',
              style: AppTypography.bodySmall.copyWith(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 12),
            AuthenticatedImageView(
              asyncBytes: photoBytes,
              maxHeight: 340,
              loadingMessage: 'Loading original wound photograph...',
              errorMessage: 'Original uploaded image is currently unavailable.',
              onRetry: () => ref.refresh(originalImageBytesProvider(data.analysisId)),
            ),
          ],
        ),
      ),
    );
  }
}
