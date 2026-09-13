class PercentageChangeResult {
  final double? rawPercentage;
  final String formattedPercentage;
  final String descriptiveFact;
  final bool isDecrease;
  final bool isIncrease;
  final bool isUnchanged;

  const PercentageChangeResult({
    required this.rawPercentage,
    required this.formattedPercentage,
    required this.descriptiveFact,
    required this.isDecrease,
    required this.isIncrease,
    required this.isUnchanged,
  });
}

class PercentageChangeCalculator {
  /// Calculates measured area change between previous scan and current scan.
  /// Formula: ((previousArea - currentArea) / previousArea) * 100
  /// Positive value indicates a reduction in measured area.
  /// Strictly avoids clinical interpretations or claims of "healing".
  static PercentageChangeResult compute({
    required double? previousArea,
    required double? currentArea,
  }) {
    if (previousArea == null || currentArea == null || previousArea <= 0.0) {
      return const PercentageChangeResult(
        rawPercentage: null,
        formattedPercentage: '—',
        descriptiveFact: 'Insufficient previous scan data for comparison.',
        isDecrease: false,
        isIncrease: false,
        isUnchanged: false,
      );
    }

    final diff = previousArea - currentArea;
    final pct = (diff / previousArea) * 100.0;
    final absPct = pct.abs().toStringAsFixed(1);

    if (pct.abs() < 0.05) {
      return const PercentageChangeResult(
        rawPercentage: 0.0,
        formattedPercentage: '0.0%',
        descriptiveFact: 'Measured wound area is unchanged compared with previous scan.',
        isDecrease: false,
        isIncrease: false,
        isUnchanged: true,
      );
    } else if (pct > 0) {
      // previous > current => area decreased
      return PercentageChangeResult(
        rawPercentage: pct,
        formattedPercentage: '-$absPct%',
        descriptiveFact: 'Wound area decreased by $absPct% compared with the previous scan.',
        isDecrease: true,
        isIncrease: false,
        isUnchanged: false,
      );
    } else {
      // previous < current => area increased
      return PercentageChangeResult(
        rawPercentage: pct,
        formattedPercentage: '+$absPct%',
        descriptiveFact: 'Wound area increased by $absPct% compared with the previous scan.',
        isDecrease: false,
        isIncrease: true,
        isUnchanged: false,
      );
    }
  }
}
