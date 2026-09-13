import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/core/theme/app_colors.dart';
import 'package:wound_insight_app/core/theme/app_typography.dart';
import 'package:wound_insight_app/core/utils/date_formatting.dart';
import 'package:wound_insight_app/core/utils/percentage_change.dart';
import 'package:wound_insight_app/models/analysis_summary_item.dart';
import 'package:wound_insight_app/providers/auth_providers.dart';
import 'package:wound_insight_app/providers/analysis_providers.dart';
import 'package:wound_insight_app/features/results/results_screen.dart';
import 'package:wound_insight_app/features/history/history_screen.dart';
import 'package:wound_insight_app/widgets/stat_tile.dart';
import 'package:wound_insight_app/widgets/wound_badge.dart';
import 'package:wound_insight_app/widgets/loading_view.dart';
import 'package:wound_insight_app/widgets/error_view.dart';

class HomeScreen extends ConsumerWidget {
  final VoidCallback onStartNewScan;

  const HomeScreen({
    super.key,
    required this.onStartNewScan,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final recentScansAsync = ref.watch(recentScansProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user?.name != null ? 'Welcome, ${user!.name}' : 'Welcome to WoundInsight',
              style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              'Track your wound progress with regular scans.',
              style: AppTypography.labelSmall.copyWith(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      ),
      body: recentScansAsync.when(
        loading: () => const LoadingView(message: 'Loading your diagnostic dashboard...'),
        error: (e, _) => ErrorView(
          message: e.toString(),
          onRetry: () => ref.refresh(recentScansProvider),
        ),
        data: (response) {
          final scans = response.analyses;

          if (scans.isEmpty) {
            return _buildEmptyState(context);
          }

          return RefreshIndicator(
            onRefresh: () async => ref.refresh(recentScansProvider.future),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Prominent Action Banner
                  _buildCallToAction(context),
                  const SizedBox(height: 20),

                  // Compact Stat Summary Cards
                  _buildStatsSection(context, scans, response.total),
                  const SizedBox(height: 24),

                  // Recent Scans Header + View All
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Recent Scans', style: AppTypography.titleLarge),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const HistoryScreen()),
                          );
                        },
                        child: const Text('View all'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Recent Scans List
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: scans.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = scans[index];
                      return _RecentScanTile(item: item);
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

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add_a_photo_outlined,
                size: 54,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Get started with your first scan',
              textAlign: TextAlign.center,
              style: AppTypography.displayMedium.copyWith(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            const Text(
              'Capture a clear photo of a wound to perform automatic tissue segmentation, contour morphometrics, and etiology triage.',
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: onStartNewScan,
              icon: const Icon(Icons.camera_alt_rounded, size: 20),
              label: const Text('+ Initiate First Scan'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 52),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCallToAction(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, Color(0xFF00897B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Record New Scan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Assess tissue composition and surface area metrics.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: onStartNewScan,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primary,
              elevation: 0,
              minimumSize: const Size(110, 44),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('+ New Scan', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context, List<AnalysisSummaryItem> scans, int totalCount) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final latestScan = scans.first;
    final latestDate = DateTime.tryParse(latestScan.createdAt);
    final daysSince = DateFormatting.daysAgo(latestDate);

    // Strictly find previous scan belonging to the SAME wound
    AnalysisSummaryItem? prevSameWoundScan;
    if (latestScan.woundId != null) {
      for (int i = 1; i < scans.length; i++) {
        if (scans[i].woundId == latestScan.woundId) {
          prevSameWoundScan = scans[i];
          break;
        }
      }
    }
    final double? prevArea = prevSameWoundScan?.woundAreaCm2;
    final change = PercentageChangeCalculator.compute(
      previousArea: prevArea,
      currentArea: latestScan.woundAreaCm2,
    );

    return Column(
      children: [
        // Primary Highlight Card: Latest Wound Area (Full Width)
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: (change.isDecrease ? AppColors.severityLow : AppColors.primary).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.aspect_ratio_rounded,
                    color: change.isDecrease ? AppColors.severityLow : AppColors.primary,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Latest Wound Area',
                        style: AppTypography.labelSmall,
                      ),
                      const SizedBox(height: 2),
                      Wrap(
                        spacing: 8,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            '${latestScan.woundAreaCm2.toStringAsFixed(2)} cm²',
                            style: AppTypography.displayMedium.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          if (prevArea != null)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: (change.isDecrease ? AppColors.severityLow : AppColors.severityModerate).withOpacity(0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '${change.formattedPercentage} measured change',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: change.isDecrease ? AppColors.severityLow : AppColors.severityModerate,
                                ),
                              ),
                            )
                          else
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: isDark ? AppColors.surfaceDark : const Color(0xFFE2E8F0),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Baseline Scan',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),

        // Secondary 2-Column Row for Last Scan and Total Scans
        Row(
          children: [
            Expanded(
              child: StatTile(
                label: 'Last Scan',
                value: daysSince,
                subtitle: DateFormatting.formatDate(latestDate),
                icon: Icons.access_time_rounded,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: StatTile(
                label: 'Total Scans',
                value: '$totalCount',
                subtitle: 'Active tracking',
                icon: Icons.analytics_outlined,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _RecentScanTile extends StatelessWidget {
  final AnalysisSummaryItem item;

  const _RecentScanTile({required this.item});

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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.healing_rounded, color: AppColors.primary, size: 20),
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
              const SizedBox(width: 6),
              const Icon(Icons.chevron_right_rounded, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
