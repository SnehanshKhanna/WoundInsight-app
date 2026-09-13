import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:wound_insight_app/core/theme/app_colors.dart';
import 'package:wound_insight_app/core/theme/app_typography.dart';

class AreaTrendChart extends StatelessWidget {
  final List<FlSpot> spots;

  const AreaTrendChart({
    super.key,
    required this.spots,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (spots.length < 2) {
      return Container(
        height: 180,
        alignment: Alignment.center,
        child: const Text(
          'At least two scans required to plot progression trend.',
          style: AppTypography.bodySmall,
        ),
      );
    }

    // Find min and max Y for sensible padding
    double maxY = 0.0;
    for (final spot in spots) {
      if (spot.y > maxY) maxY = spot.y;
    }
    maxY = (maxY * 1.25).clamp(1.0, 100.0);

    return AspectRatio(
      aspectRatio: 1.8,
      child: Padding(
        padding: const EdgeInsets.only(right: 18, left: 6, top: 12, bottom: 8),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: (maxY / 4).clamp(0.5, 25.0),
              getDrawingHorizontalLine: (value) => FlLine(
                color: isDark ? AppColors.borderDark : AppColors.borderLight,
                strokeWidth: 1,
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 26,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    final idx = value.toInt();
                    if (idx < 0 || idx >= spots.length) return const SizedBox.shrink();
                    return Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        'Scan #${idx + 1}',
                        style: AppTypography.labelSmall.copyWith(
                          fontSize: 10,
                          color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                        ),
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: (maxY / 3).clamp(0.5, 20.0),
                  reservedSize: 34,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toStringAsFixed(1),
                      style: AppTypography.labelSmall.copyWith(
                        fontSize: 10,
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                    );
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            minX: 0,
            maxX: (spots.length - 1).toDouble(),
            minY: 0,
            maxY: maxY,
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                curveSmoothness: 0.35,
                color: AppColors.primary,
                barWidth: 3.5,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                    radius: 5,
                    color: Colors.white,
                    strokeWidth: 2.5,
                    strokeColor: AppColors.primary,
                  ),
                ),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withOpacity(0.28),
                      AppColors.primary.withOpacity(0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((spot) {
                    return LineTooltipItem(
                      'Scan #${spot.x.toInt() + 1}\n${spot.y.toStringAsFixed(2)} cm²',
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
