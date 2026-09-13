import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/core/theme/app_colors.dart';
import 'package:wound_insight_app/core/theme/app_typography.dart';
import 'package:wound_insight_app/models/wound.dart';
import 'package:wound_insight_app/providers/analysis_providers.dart';
import 'package:wound_insight_app/providers/progress_providers.dart';
import 'package:wound_insight_app/providers/wound_providers.dart';
import 'package:wound_insight_app/features/results/results_screen.dart';
import 'package:wound_insight_app/features/wounds/wound_selection_sheet.dart';
import 'package:wound_insight_app/widgets/loading_view.dart';
import 'package:wound_insight_app/widgets/error_view.dart';

class ScanPreviewScreen extends ConsumerStatefulWidget {
  final String imagePath;
  final Wound wound;

  const ScanPreviewScreen({
    super.key,
    required this.imagePath,
    required this.wound,
  });

  @override
  ConsumerState<ScanPreviewScreen> createState() => _ScanPreviewScreenState();
}

class _ScanPreviewScreenState extends ConsumerState<ScanPreviewScreen> {
  late Wound _currentWound;

  @override
  void initState() {
    super.initState();
    _currentWound = widget.wound;
  }

  Future<void> _changeWound() async {
    final chosen = await WoundSelectionSheet.show(context);
    if (chosen != null && mounted) {
      setState(() {
        _currentWound = chosen;
      });
    }
  }

  Future<void> _startAnalysis() async {
    final notifier = ref.read(scanSubmissionProvider.notifier);
    final result = await notifier.submitScan(
      imagePath: widget.imagePath,
      woundId: _currentWound.id,
    );

    if (result != null && mounted) {
      // Invalidate recent scans, user scans, wound progress, and wound list so all tabs refresh immediately
      ref.invalidate(recentScansProvider);
      ref.invalidate(allUserScansProvider);
      ref.invalidate(woundProgressProvider);
      ref.invalidate(woundListProvider);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ResultsScreen(analysisId: result.analysisId, initialData: result),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final submissionState = ref.watch(scanSubmissionProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Preview'),
      ),
      body: SafeArea(
        child: submissionState.isSubmitting
            ? LoadingView(
                message: 'Analyzing your scan...\nRunning segmentation, tissue composition, and etiology classifier.',
                onCancel: () {
                  ref.read(scanSubmissionProvider.notifier).cancel();
                },
              )
            : submissionState.status == ScanSubmissionStatus.error
                ? ErrorView(
                    message: submissionState.errorMessage ?? 'Failed to analyze scan.',
                    onRetry: () => _startAnalysis(),
                    retryLabel: 'Retry Analysis',
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Target wound header
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: isDark ? AppColors.surfaceDark : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.healing_rounded, color: AppColors.primary, size: 22),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Target Wound Profile', style: AppTypography.labelSmall),
                                    Text(
                                      _currentWound.name,
                                      style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    if (_currentWound.location != null)
                                      Text(_currentWound.location!, style: AppTypography.bodySmall),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: _changeWound,
                                child: const Text('Change'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Photo preview container (aspect-ratio-aware, avoids stark black voids)
                        Expanded(
                          child: Center(
                            child: Container(
                              constraints: const BoxConstraints(maxHeight: 460),
                              decoration: BoxDecoration(
                                color: isDark ? AppColors.surfaceDark : const Color(0xFFF8FAFC),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: isDark ? AppColors.borderDark : AppColors.borderLight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(isDark ? 0.25 : 0.05),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.file(
                                File(widget.imagePath),
                                fit: BoxFit.contain,
                                errorBuilder: (_, _, _) => Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.broken_image_rounded, size: 48, color: isDark ? Colors.white38 : Colors.black26),
                                      const SizedBox(height: 8),
                                      const Text('Unable to preview image', style: AppTypography.labelSmall),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Action buttons
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: OutlinedButton.icon(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(Icons.refresh_rounded, size: 18),
                                label: const FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text('Retake', maxLines: 1),
                                ),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 3,
                              child: ElevatedButton.icon(
                                onPressed: _startAnalysis,
                                icon: const Icon(Icons.analytics_rounded, size: 20),
                                label: const FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text('Analyze Scan', maxLines: 1),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
