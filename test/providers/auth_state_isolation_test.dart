import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wound_insight_app/models/user.dart';
import 'package:wound_insight_app/models/analysis_list_response.dart';
import 'package:wound_insight_app/models/analysis_summary_item.dart';
import 'package:wound_insight_app/providers/auth_providers.dart';
import 'package:wound_insight_app/providers/core_providers.dart';
import 'package:wound_insight_app/providers/progress_providers.dart';
import 'package:wound_insight_app/repositories/analysis_repository.dart';

class MockAnalysisRepository extends Mock implements AnalysisRepository {}

void main() {
  late MockAnalysisRepository mockRepo;
  late ProviderContainer container;
  
  setUp(() {
    mockRepo = MockAnalysisRepository();
  });
  
  test('woundProgressProvider resets when user logs out', () async {
    // Setup Mock: When User A requests data, return 5 scans.
    when(() => mockRepo.getUserAnalyses(woundId: any(named: 'woundId'), limit: any(named: 'limit')))
      .thenAnswer((_) async => AnalysisListResponse(
        total: 5,
        limit: 100,
        offset: 0,
        analyses: List.generate(5, (index) => AnalysisSummaryItem(
          analysisId: 'id-$index',
          woundId: 'w-1',
          createdAt: DateTime.now().toIso8601String(),
          woundAreaCm2: 10.0,
          severityGrade: 'Low',
          originalFilename: 'test.png',
          aiConfidenceScore: 0.95,
          clinicianReviewFlag: false,
          etiologyConfidence: 0.88,
          predictedEtiology: 'Diabetic Foot Ulcer',
          reportImageUrl: 'test_report.png',
          severityScore: 12.5,
        )),
      ));

    final userProvider = StateProvider<User?>((ref) => null);

    container = ProviderContainer(
      overrides: [
        analysisRepositoryProvider.overrideWithValue(mockRepo),
        currentUserProvider.overrideWith((ref) => ref.watch(userProvider)),
      ],
    );

    // 1. Initially user is null. Provider should return empty state immediately without calling repo.
    var progressData = await container.read(woundProgressProvider('w-1').future);
    expect(progressData.totalScans, 0);
    verifyNever(() => mockRepo.getUserAnalyses(woundId: any(named: 'woundId'), limit: any(named: 'limit')));

    // 2. User A logs in.
    container.read(userProvider.notifier).state = const User(id: 'u-1', email: 'a@a.com', name: 'A', createdAt: '2026-09-15');
    
    // Read again. Now it should fetch.
    progressData = await container.read(woundProgressProvider('w-1').future);
    expect(progressData.totalScans, 5);
    verify(() => mockRepo.getUserAnalyses(woundId: 'w-1', limit: 100)).called(1);

    // 3. User A logs out (user becomes null).
    container.read(userProvider.notifier).state = null;

    // Read again. Should immediately be empty state (0 scans).
    progressData = await container.read(woundProgressProvider('w-1').future);
    expect(progressData.totalScans, 0);
    // Should NOT call repo again.
    verifyNever(() => mockRepo.getUserAnalyses(woundId: any(named: 'woundId'), limit: any(named: 'limit')));
  });
}
