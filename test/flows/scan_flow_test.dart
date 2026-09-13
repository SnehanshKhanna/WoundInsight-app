import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wound_insight_app/features/auth/login_screen.dart';
import 'package:wound_insight_app/features/main_navigation_shell.dart';
import 'package:wound_insight_app/models/analysis_list_response.dart';
import 'package:wound_insight_app/models/analysis_result.dart';
import 'package:wound_insight_app/models/etiology_diagnostics.dart';
import 'package:wound_insight_app/models/safety_qa.dart';
import 'package:wound_insight_app/models/severity_assessment.dart';
import 'package:wound_insight_app/models/tissue_composition.dart';
import 'package:wound_insight_app/models/user.dart';
import 'package:wound_insight_app/models/visual_outputs.dart';
import 'package:wound_insight_app/models/wound.dart';
import 'package:wound_insight_app/models/wound_morphometrics.dart';
import 'package:wound_insight_app/providers/analysis_providers.dart';
import 'package:wound_insight_app/providers/auth_providers.dart';
import 'package:wound_insight_app/providers/core_providers.dart';
import 'package:wound_insight_app/repositories/analysis_repository.dart';
import 'package:wound_insight_app/repositories/auth_repository.dart';
import 'package:wound_insight_app/repositories/wound_repository.dart';
import 'package:wound_insight_app/services/image/image_capture_service.dart';

class MockAuthRepository extends Mock implements AuthRepository {}
class MockWoundRepository extends Mock implements WoundRepository {}
class MockAnalysisRepository extends Mock implements AnalysisRepository {}
class MockImageCaptureService extends Mock implements ImageCaptureService {}

void main() {
  late MockAuthRepository mockAuthRepo;
  late MockWoundRepository mockWoundRepo;
  late MockAnalysisRepository mockAnalysisRepo;
  late MockImageCaptureService mockImageCapture;
  late SharedPreferences prefs;

  const testUser = User(
    id: 'user-001',
    email: 'clinician@woundinsight.edu',
    name: 'Dr. Marcus Vance',
    createdAt: '2026-09-13T10:00:00Z',
  );

  const testWound = Wound(
    id: 'wound-001',
    userId: 'user-001',
    name: 'Left Foot Ulcer',
    location: 'Plantar aspect of first metatarsal head',
    createdAt: '2026-09-13T10:00:00Z',
  );

  const testResult = AnalysisResult(
    analysisId: 'analysis-flow-999',
    status: 'success',
    timestamp: '2026-09-13T16:45:00Z',
    originalFilename: 'wound_capture.png',
    wound: WoundMorphometrics(
      detected: true,
      areaPixels: 2044,
      areaCm2: 1.85,
      perimeterMm: 32.0,
      circularity: 0.9,
      isIrregular: false,
    ),
    tissue: TissueComposition(
      fibrinSloughPercent: 15.0,
      granulationPercent: 75.0,
      callusPercent: 10.0,
    ),
    etiology: EtiologyDiagnostics(
      predictedType: 'Diabetic Foot Ulcer',
      confidence: 92.4,
      probabilities: EtiologyProbabilities(
        dfu: 92.4,
        pressure: 0.0,
        surgical: 0.0,
        venous: 7.6,
      ),
    ),
    severity: SeverityAssessment(
      severityScore: 16.0,
      severityGrade: 'Moderate',
      recommendedAction: 'Offloading footwear and moisture retentive dressing.',
    ),
    uncertainty: SafetyQA(
      aiConfidenceScore: 94.0,
      requiresClinicianReview: false,
    ),
    visualizations: VisualOutputs(
      reportImageUrl: '/report',
      reportFilename: 'report.png',
      originalImageUrl: '/image',
    ),
  );

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();

    mockAuthRepo = MockAuthRepository();
    mockWoundRepo = MockWoundRepository();
    mockAnalysisRepo = MockAnalysisRepository();
    mockImageCapture = MockImageCaptureService();

    when(() => mockAuthRepo.tryAutoLogin()).thenAnswer((_) async => null);
    when(() => mockAuthRepo.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenAnswer((_) async => testUser);

    when(() => mockWoundRepo.getWounds()).thenAnswer((_) async => [testWound]);

    when(() => mockAnalysisRepo.getUserAnalyses(
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
          woundId: any(named: 'woundId'),
        )).thenAnswer((_) async => const AnalysisListResponse(
          analyses: [],
          total: 0,
          limit: 20,
          offset: 0,
        ));

    when(() => mockAnalysisRepo.analyzeWoundImage(
          filePath: any(named: 'filePath'),
          woundId: any(named: 'woundId'),
          cancelToken: any(named: 'cancelToken'),
        )).thenAnswer((_) async => testResult);

    when(() => mockAnalysisRepo.getOriginalImageUrl(any())).thenReturn('http://test/orig.png');
    when(() => mockAnalysisRepo.getGradCamImageUrl(any())).thenReturn('http://test/cam.png');
    when(() => mockAnalysisRepo.getReportImageUrl(any())).thenReturn('http://test/rep.png');
    when(() => mockAnalysisRepo.getOriginalImageBytes(any())).thenAnswer((_) async => Uint8List.fromList([1, 2, 3]));
    when(() => mockAnalysisRepo.getGradCamBytes(any())).thenAnswer((_) async => Uint8List.fromList([1, 2, 3]));
    when(() => mockAnalysisRepo.getReportImageBytes(any())).thenAnswer((_) async => Uint8List.fromList([1, 2, 3]));

    when(() => mockImageCapture.pickFromGallery()).thenAnswer((_) async => 'test/assets/fake.png');
  });

  testWidgets(
    'Full happy-path navigation flow: Login -> Home -> New Scan -> Select Wound -> Capture -> Preview -> Analyze -> Results',
    (tester) async {
      // Build top-level app driven by Riverpod state
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(prefs),
            authRepositoryProvider.overrideWithValue(mockAuthRepo),
            woundRepositoryProvider.overrideWithValue(mockWoundRepo),
            analysisRepositoryProvider.overrideWithValue(mockAnalysisRepo),
            imageCaptureServiceProvider.overrideWithValue(mockImageCapture),
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
            home: Consumer(
              builder: (context, ref, child) {
                final authState = ref.watch(authStateProvider);
                if (authState.isAuthenticated) {
                  return const MainNavigationShell();
                }
                return const LoginScreen();
              },
            ),
          ),
        ),
      );

      await tester.pump();

      // 1. Verify on Login Screen
      expect(find.text('WoundInsight'), findsWidgets);

      // Enter email and password
      final textFields = find.byType(TextFormField);
      expect(textFields, findsNWidgets(2));
      await tester.enterText(textFields.at(0), 'clinician@woundinsight.edu');
      await tester.enterText(textFields.at(1), 'clinicalPassword123');

      // Tap Log In
      await tester.tap(find.text('Log In'));
      await tester.pumpAndSettle();

      // 2. Verify landed on Home Screen inside MainNavigationShell
      expect(find.text('Welcome, Dr. Marcus Vance'), findsOneWidget);
      expect(find.text('Get started with your first scan'), findsOneWidget);

      // 3. Initiate New Scan Flow via FAB / Button
      await tester.tap(find.text('+ Initiate First Scan'));
      await tester.pumpAndSettle();

      // 4. Wound Selection Sheet should be displayed
      expect(find.text('Select Wound Profile'), findsOneWidget);
      expect(find.text('Left Foot Ulcer'), findsOneWidget);

      // Tap the wound
      await tester.tap(find.text('Left Foot Ulcer'));
      await tester.pumpAndSettle();

      // 5. Source selection modal appears (Camera / Gallery)
      expect(find.text('Choose from Gallery'), findsOneWidget);

      // Tap Choose from Gallery
      await tester.tap(find.text('Choose from Gallery'));
      await tester.pumpAndSettle();

      // 6. Landed on ScanPreviewScreen
      expect(find.text('Scan Preview'), findsOneWidget);
      expect(find.text('Left Foot Ulcer'), findsOneWidget);
      expect(find.text('Analyze Scan'), findsOneWidget);

      // Tap Analyze Scan
      await tester.tap(find.text('Analyze Scan'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      await tester.pump(const Duration(milliseconds: 300));

      // 7. Landed on ResultsScreen with analyzed wound data
      expect(find.text('AI Analysis Results'), findsOneWidget);
      expect(find.text('Diabetic Foot Ulcer'), findsOneWidget);
      expect(find.text('Wound Morphometrics'), findsOneWidget);
      expect(find.text('1.85 cm²'), findsOneWidget);
      expect(find.text('AI System Recommendation'), findsOneWidget);
      expect(find.text('Offloading footwear and moisture retentive dressing.'), findsOneWidget);
    },
  );
}
