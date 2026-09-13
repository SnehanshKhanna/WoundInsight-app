import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/core/theme/app_colors.dart';
import 'package:wound_insight_app/core/theme/app_typography.dart';
import 'package:wound_insight_app/core/utils/date_formatting.dart';
import 'package:wound_insight_app/models/wound.dart';
import 'package:wound_insight_app/models/analysis_summary_item.dart';
import 'package:wound_insight_app/providers/wound_providers.dart';
import 'package:wound_insight_app/providers/progress_providers.dart';
import 'package:wound_insight_app/features/results/results_screen.dart';
import 'package:wound_insight_app/features/progress/widgets/area_trend_chart.dart';
import 'package:wound_insight_app/widgets/stat_tile.dart';
import 'package:wound_insight_app/widgets/wound_badge.dart';
import 'package:wound_insight_app/widgets/loading_view.dart';
import 'package:wound_insight_app/widgets/error_view.dart';
import 'package:wound_insight_app/widgets/empty_state_view.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final woundListAsync = ref.watch(woundListProvider);
    final selectedWound = ref.watch(selectedWoundProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wound Progression'),
      ),
      body: woundListAsync.when(
        loading: () => const LoadingView(message: 'Loading wound profiles...'),
        error: (e, _) => ErrorView(
          message: e.toString(),
          onRetry: () => ref.read(woundListProvider.notifier).fetchWounds(),
        ),
        data: (wounds) {
          if (wounds.isEmpty) {
            return const EmptyStateView(
              icon: Icons.healing_rounded,
              title: 'No Wound Profiles Tracked',
              description: 'Create a wound profile when initiating a new scan to monitor longitudinal progression.',
            );
          }

          final currentWound = selectedWound ?? wounds.first;
          final progressAsync = ref.watch(woundProgressProvider(currentWound.id));

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(woundProgressProvider);
              ref.invalidate(woundListProvider);
              await ref.read(woundProgressProvider(currentWound.id).future);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Wound Selector Dropdown
                  _buildWoundSelector(context, ref, wounds, currentWound, isDark),
                  const SizedBox(height: 16),

                  // Progress metrics & chart
                  progressAsync.when(
                    loading: () => const SizedBox(
                      height: 250,
                      child: LoadingView(message: 'Calculating longitudinal morphometrics...'),
                    ),
                    error: (e, _) => ErrorView(
                      message: e.toString(),
                      onRetry: () => ref.refresh(woundProgressProvider(currentWound.id)),
                    ),
                    data: (data) {
                      if (!data.hasSufficientData) {
                        return Column(
                          children: [
                            if (data.totalScans == 1) ...[
                              _buildSingleScanNotice(context, data, isDark),
                              const SizedBox(height: 20),
                            ],
                            const EmptyStateView(
                              icon: Icons.timeline_rounded,
                              title: 'Insufficient Scans for Trend',
                              description: 'Complete at least two scans for this wound to plot area progression and calculate measured percentage change.',
                            ),
                          ],
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Stat Grid
                          _buildStatGrid(data),
                          const SizedBox(height: 16),

                          // Factual Percentage Change Banner
                          _buildChangeBanner(context, data, isDark),
                          const SizedBox(height: 16),

                          // Line Chart Card
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Expanded(
                                        child: Text('Estimated Area Over Time (cm²)', style: AppTypography.titleMedium),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '${data.totalScans} Recorded Scans',
                                        style: AppTypography.labelSmall.copyWith(
                                          color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  AreaTrendChart(spots: data.spots),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Timeline of scans for this wound
                          const Text('Wound Scan Timeline', style: AppTypography.titleLarge),
                          const SizedBox(height: 12),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data.timeline.length,
                            separatorBuilder: (_, _) => const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              final item = data.timeline[index];
                              return _TimelineItemCard(
                                item: item,
                                scanIndex: data.timeline.length - index,
                                woundName: currentWound.name,
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWoundSelector(
    BuildContext context,
    WidgetRef ref,
    List<Wound> wounds,
    Wound selected,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: isDark ? AppColors.borderDark : AppColors.borderLight),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected.id,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          items: wounds.map((w) {
            return DropdownMenuItem(
              value: w.id,
              child: Text(
                '${w.name}${w.location != null ? ' (${w.location})' : ''}',
                style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.w600),
              ),
            );
          }).toList(),
          onChanged: (id) {
            if (id != null) {
              ref.read(selectedWoundIdProvider.notifier).state = id;
            }
          },
        ),
      ),
    );
  }

  Widget _buildSingleScanNotice(BuildContext context, WoundProgressData data, bool isDark) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.info_outline_rounded, color: AppColors.primary, size: 24),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('1 Scan Recorded', style: AppTypography.titleMedium),
                  const SizedBox(height: 2),
                  Text(
                    'Latest measured area: ${data.latestArea?.toStringAsFixed(2)} cm². Take a follow-up scan to compare change.',
                    style: AppTypography.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatGrid(WoundProgressData data) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.15,
      children: [
        StatTile(
          label: 'Latest Measured Area',
          value: '${data.latestArea?.toStringAsFixed(2) ?? "—"} cm²',
          subtitle: data.previousArea != null ? 'Previous: ${data.previousArea!.toStringAsFixed(2)} cm²' : null,
          icon: Icons.aspect_ratio_rounded,
        ),
        StatTile(
          label: 'Measured Area Delta',
          value: data.changeResult.formattedPercentage,
          subtitle: data.changeResult.isDecrease
              ? 'Reduction measured'
              : (data.changeResult.isIncrease ? 'Increase measured' : 'Unchanged'),
          icon: Icons.trending_down_rounded,
          accentColor: data.changeResult.isDecrease ? AppColors.severityLow : AppColors.primary,
        ),
        StatTile(
          label: 'First Monitored Scan',
          value: DateFormatting.formatDate(data.firstScanDate),
          icon: Icons.calendar_today_outlined,
        ),
        StatTile(
          label: 'Latest Monitored Scan',
          value: DateFormatting.formatDate(data.latestScanDate),
          icon: Icons.event_available_outlined,
        ),
      ],
    );
  }

  Widget _buildChangeBanner(BuildContext context, WoundProgressData data, bool isDark) {
    final res = data.changeResult;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: res.isDecrease
            ? AppColors.severityLow.withOpacity(0.12)
            : (res.isIncrease
                ? AppColors.severityModerate.withOpacity(0.12)
                : (isDark ? AppColors.surfaceDark : const Color(0xFFF1F5F9))),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: res.isDecrease
              ? AppColors.severityLow.withOpacity(0.3)
              : (res.isIncrease ? AppColors.severityModerate.withOpacity(0.3) : AppColors.borderLight),
        ),
      ),
      child: Row(
        children: [
          Icon(
            res.isDecrease
                ? Icons.arrow_downward_rounded
                : (res.isIncrease ? Icons.arrow_upward_rounded : Icons.horizontal_rule_rounded),
            color: res.isDecrease ? AppColors.severityLow : (res.isIncrease ? AppColors.severityModerate : AppColors.primary),
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Measured Progression Fact',
                  style: AppTypography.labelSmall.copyWith(
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  res.descriptiveFact,
                  style: AppTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineItemCard extends StatelessWidget {
  final AnalysisSummaryItem item;
  final int scanIndex;
  final String woundName;

  const _TimelineItemCard({
    required this.item,
    required this.scanIndex,
    required this.woundName,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primary.withOpacity(0.1),
                child: Text(
                  '#$scanIndex',
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        Text(
                          'Estimated: ${item.woundAreaCm2.toStringAsFixed(2)} cm²',
                          style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.w700),
                        ),
                        WoundBadge(label: item.severityGrade, isSeverity: true),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Profile: $woundName • AI Triage: ${item.predictedEtiology}',
                      style: AppTypography.bodySmall.copyWith(
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      DateFormatting.formatIso(item.createdAt),
                      style: AppTypography.labelSmall.copyWith(
                        color: isDark ? AppColors.textSecondaryDark.withOpacity(0.8) : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
