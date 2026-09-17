import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/core/utils/percentage_change.dart';
import 'package:wound_insight_app/models/analysis_summary_item.dart';
import 'package:wound_insight_app/providers/core_providers.dart';

import 'package:wound_insight_app/providers/auth_providers.dart';

class WoundProgressData {
  final String woundId;
  final int totalScans;
  final DateTime? firstScanDate;
  final DateTime? latestScanDate;
  final double? latestArea;
  final double? previousArea;
  final PercentageChangeResult changeResult;
  final List<FlSpot> spots;
  final List<AnalysisSummaryItem> timeline;

  const WoundProgressData({
    required this.woundId,
    required this.totalScans,
    required this.firstScanDate,
    required this.latestScanDate,
    required this.latestArea,
    required this.previousArea,
    required this.changeResult,
    required this.spots,
    required this.timeline,
  });

  bool get hasSufficientData => totalScans >= 2;
}

final woundProgressProvider =
    FutureProvider.family<WoundProgressData, String>((ref, woundId) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) {
    return WoundProgressData(
      woundId: woundId,
      totalScans: 0,
      firstScanDate: null,
      latestScanDate: null,
      latestArea: null,
      previousArea: null,
      changeResult: PercentageChangeCalculator.compute(previousArea: null, currentArea: null),
      spots: const [],
      timeline: const [],
    );
  }

  final repo = ref.watch(analysisRepositoryProvider);
  final response = await repo.getUserAnalyses(woundId: woundId, limit: 100);
  final items = response.analyses;

  if (items.isEmpty) {
    return WoundProgressData(
      woundId: woundId,
      totalScans: 0,
      firstScanDate: null,
      latestScanDate: null,
      latestArea: null,
      previousArea: null,
      changeResult: PercentageChangeCalculator.compute(previousArea: null, currentArea: null),
      spots: const [],
      timeline: const [],
    );
  }

  // Items come from API in DESCENDING order (newest first)
  final newestFirst = List<AnalysisSummaryItem>.from(items);
  final oldestFirst = List<AnalysisSummaryItem>.from(items.reversed);

  final latestItem = newestFirst.first;
  final latestArea = latestItem.woundAreaCm2;
  final latestDate = DateTime.tryParse(latestItem.createdAt);

  final firstItem = oldestFirst.first;
  final firstDate = DateTime.tryParse(firstItem.createdAt);

  double? previousArea;
  if (newestFirst.length >= 2) {
    previousArea = newestFirst[1].woundAreaCm2;
  }

  final change = PercentageChangeCalculator.compute(
    previousArea: previousArea,
    currentArea: latestArea,
  );

  final spots = <FlSpot>[];
  for (int i = 0; i < oldestFirst.length; i++) {
    spots.add(FlSpot(i.toDouble(), oldestFirst[i].woundAreaCm2));
  }

  return WoundProgressData(
    woundId: woundId,
    totalScans: items.length,
    firstScanDate: firstDate,
    latestScanDate: latestDate,
    latestArea: latestArea,
    previousArea: previousArea,
    changeResult: change,
    spots: spots,
    timeline: newestFirst,
  );
});
