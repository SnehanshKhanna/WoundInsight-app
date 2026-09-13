import 'package:flutter_test/flutter_test.dart';
import 'package:wound_insight_app/core/utils/percentage_change.dart';

void main() {
  group('PercentageChangeCalculator Tests', () {
    test('calculates reduction correctly with measured clinical statement', () {
      final result = PercentageChangeCalculator.compute(
        previousArea: 2.0,
        currentArea: 1.5,
      );

      expect(result.rawPercentage, 25.0);
      expect(result.isDecrease, isTrue);
      expect(result.isIncrease, isFalse);
      expect(result.isUnchanged, isFalse);
      expect(result.formattedPercentage, '-25.0%');
      expect(
        result.descriptiveFact,
        'Wound area decreased by 25.0% compared with the previous scan.',
      );
      // Ensure no prohibited clinical words
      expect(result.descriptiveFact.toLowerCase().contains('healing'), isFalse);
      expect(result.descriptiveFact.toLowerCase().contains('cured'), isFalse);
    });

    test('calculates increase correctly with measured statement', () {
      final result = PercentageChangeCalculator.compute(
        previousArea: 1.0,
        currentArea: 1.25,
      );

      expect(result.rawPercentage, -25.0);
      expect(result.isIncrease, isTrue);
      expect(result.isDecrease, isFalse);
      expect(result.isUnchanged, isFalse);
      expect(result.formattedPercentage, '+25.0%');
      expect(
        result.descriptiveFact,
        'Wound area increased by 25.0% compared with the previous scan.',
      );
    });

    test('handles zero change cleanly', () {
      final result = PercentageChangeCalculator.compute(
        previousArea: 3.4,
        currentArea: 3.4,
      );

      expect(result.rawPercentage, 0.0);
      expect(result.isUnchanged, isTrue);
      expect(result.formattedPercentage, '0.0%');
      expect(
        result.descriptiveFact,
        'Measured wound area is unchanged compared with previous scan.',
      );
    });

    test('handles null previousArea gracefully without crashing', () {
      final result = PercentageChangeCalculator.compute(
        previousArea: null,
        currentArea: 2.5,
      );

      expect(result.rawPercentage, isNull);
      expect(result.formattedPercentage, '—');
      expect(result.descriptiveFact, 'Insufficient previous scan data for comparison.');
    });

    test('handles zero previousArea without division by zero', () {
      final result = PercentageChangeCalculator.compute(
        previousArea: 0.0,
        currentArea: 1.5,
      );

      expect(result.rawPercentage, isNull);
      expect(result.formattedPercentage, '—');
      expect(result.descriptiveFact, 'Insufficient previous scan data for comparison.');
    });

    test('handles null currentArea gracefully', () {
      final result = PercentageChangeCalculator.compute(
        previousArea: 2.0,
        currentArea: null,
      );

      expect(result.rawPercentage, isNull);
      expect(result.formattedPercentage, '—');
      expect(result.descriptiveFact, 'Insufficient previous scan data for comparison.');
    });

    test('handles both areas zero gracefully', () {
      final result = PercentageChangeCalculator.compute(
        previousArea: 0.0,
        currentArea: 0.0,
      );

      expect(result.rawPercentage, isNull);
      expect(result.formattedPercentage, '—');
      expect(result.descriptiveFact, 'Insufficient previous scan data for comparison.');
    });
  });
}
