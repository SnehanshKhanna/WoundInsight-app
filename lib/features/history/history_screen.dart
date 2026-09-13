import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/core/theme/app_colors.dart';
import 'package:wound_insight_app/core/theme/app_typography.dart';
import 'package:wound_insight_app/core/utils/date_formatting.dart';
import 'package:wound_insight_app/models/analysis_summary_item.dart';
import 'package:wound_insight_app/providers/analysis_providers.dart';
import 'package:wound_insight_app/providers/wound_providers.dart';
import 'package:wound_insight_app/features/results/results_screen.dart';
import 'package:wound_insight_app/widgets/wound_badge.dart';
import 'package:wound_insight_app/widgets/loading_view.dart';
import 'package:wound_insight_app/widgets/error_view.dart';
import 'package:wound_insight_app/widgets/empty_state_view.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scansAsync = ref.watch(allUserScansProvider(0));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan History'),
      ),
      body: scansAsync.when(
        loading: () => const LoadingView(message: 'Loading scan records...'),
        error: (e, _) => ErrorView(
          message: e.toString(),
          onRetry: () => ref.refresh(allUserScansProvider(0)),
        ),
        data: (response) {
          final items = response.analyses;
          if (items.isEmpty) {
            return const EmptyStateView(
              icon: Icons.history_rounded,
              title: 'No Historical Scans',
              description: 'You have not submitted any scans yet. Complete a scan to see your diagnostic timeline here.',
            );
          }

          return RefreshIndicator(
            onRefresh: () async => ref.refresh(allUserScansProvider(0).future),
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              itemCount: items.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = items[index];
                return _HistoryCard(item: item);
              },
            ),
          );
        },
      ),
    );
  }
}

class _HistoryCard extends ConsumerWidget {
  final AnalysisSummaryItem item;

  const _HistoryCard({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final wounds = ref.watch(woundListProvider).value;
    String? woundName;
    if (item.woundId != null && wounds != null) {
      for (final w in wounds) {
        if (w.id == item.woundId) {
          woundName = w.name;
          break;
        }
      }
    }

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ResultsScreen(analysisId: item.analysisId),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.healing_rounded,
                  color: AppColors.primary,
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.predictedEtiology,
                      style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.w700),
                    ),
                    if (woundName != null) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(Icons.healing_outlined, size: 12, color: AppColors.primary),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              'Profile: $woundName',
                              style: AppTypography.labelSmall.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        WoundBadge(label: item.severityGrade, isSeverity: true),
                        Text(
                          DateFormatting.formatIso(item.createdAt),
                          style: AppTypography.labelSmall.copyWith(
                            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                          ),
                        ),
                        Text('•', style: TextStyle(color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
                        Text(
                          'Estimated: ${item.woundAreaCm2.toStringAsFixed(2)} cm²',
                          style: AppTypography.labelSmall.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right_rounded, size: 20, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
