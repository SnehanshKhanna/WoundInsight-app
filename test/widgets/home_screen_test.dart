import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/features/home/home_screen.dart';
import 'package:wound_insight_app/models/analysis_list_response.dart';
import 'package:wound_insight_app/models/analysis_summary_item.dart';
import 'package:wound_insight_app/models/user.dart';
import 'package:wound_insight_app/providers/analysis_providers.dart';
import 'package:wound_insight_app/providers/auth_providers.dart';

void main() {
  const testUser = User(
    id: 'user-001',
    email: 'test@woundinsight.edu',
    name: 'Sarah Connor',
    createdAt: '2026-09-13T10:00:00Z',
  );

  group('HomeScreen Widget Tests', () {
    testWidgets('renders friendly empty state when user has no scans', (tester) async {
      bool scanInitiated = false;

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            currentUserProvider.overrideWithValue(testUser),
            recentScansProvider.overrideWith(
              (ref) async => const AnalysisListResponse(
                analyses: [],
                total: 0,
                limit: 20,
                offset: 0,
              ),
            ),
          ],
          child: MaterialApp(
            home: HomeScreen(
              onStartNewScan: () {
                scanInitiated = true;
              },
            ),
          ),
        ),
      );

      await tester.pump();

      // Welcome header displays user name
      expect(find.text('Welcome, Sarah Connor'), findsOneWidget);

      // Empty state content displays
      expect(find.text('Get started with your first scan'), findsOneWidget);
      expect(find.text('+ Initiate First Scan'), findsOneWidget);

      // Stat cards should NOT be shown
      expect(find.text('Recent Scans'), findsNothing);
      expect(find.text('Total Scans'), findsNothing);

      // Tap initiate first scan
      await tester.tap(find.text('+ Initiate First Scan'));
      expect(scanInitiated, isTrue);
    });

    testWidgets('renders populated dashboard with stats and recent scan list', (tester) async {
      final sampleScans = [
        const AnalysisSummaryItem(
          analysisId: 'scan-001',
          createdAt: '2026-09-13T12:00:00Z',
          originalFilename: 'wound_sample1.png',
          woundId: 'w-1',
          predictedEtiology: 'Venous Ulcer',
          etiologyConfidence: 89.0,
          woundAreaCm2: 2.15,
          severityGrade: 'Low (Mild)',
          severityScore: 12.0,
          aiConfidenceScore: 92.0,
          clinicianReviewFlag: false,
          reportImageUrl: '/report',
        ),
        const AnalysisSummaryItem(
          analysisId: 'scan-002',
          createdAt: '2026-09-10T12:00:00Z',
          originalFilename: 'wound_sample2.png',
          woundId: 'w-1',
          predictedEtiology: 'Venous Ulcer',
          etiologyConfidence: 85.0,
          woundAreaCm2: 2.80,
          severityGrade: 'Moderate',
          severityScore: 22.0,
          aiConfidenceScore: 88.0,
          clinicianReviewFlag: false,
          reportImageUrl: '/report',
        ),
      ];

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            currentUserProvider.overrideWithValue(testUser),
            recentScansProvider.overrideWith(
              (ref) async => AnalysisListResponse(
                analyses: sampleScans,
                total: 2,
                limit: 20,
                offset: 0,
              ),
            ),
          ],
          child: MaterialApp(
            home: HomeScreen(
              onStartNewScan: () {},
            ),
          ),
        ),
      );

      await tester.pump();

      // Header and CTA
      expect(find.text('Welcome, Sarah Connor'), findsOneWidget);
      expect(find.text('Record New Scan'), findsOneWidget);
      expect(find.text('+ New Scan'), findsOneWidget);

      // Stat Cards
      expect(find.text('Last Scan'), findsOneWidget);
      expect(find.text('Latest Wound Area'), findsOneWidget);
      expect(find.text('Total Scans'), findsOneWidget);
      expect(find.text('2'), findsOneWidget); // 2 total scans

      // Recent Scans list
      expect(find.text('Recent Scans'), findsOneWidget);
      expect(find.text('View all'), findsOneWidget);
      expect(find.text('Venous Ulcer'), findsWidgets);
      expect(find.text('Estimated: 2.15 cm²'), findsOneWidget);
    });
  });
}
