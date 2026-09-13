import 'package:flutter_test/flutter_test.dart';
import 'package:wound_insight_app/core/utils/percentage_change.dart';

void main() {
  test('PercentageChangeCalculator smoke test', () {
    final result = PercentageChangeCalculator.compute(previousArea: 2.0, currentArea: 1.5);
    expect(result.isDecrease, isTrue);
    expect(result.formattedPercentage, '-25.0%');
  });
}
