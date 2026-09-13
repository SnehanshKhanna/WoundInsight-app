import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wound_insight_app/features/results/results_screen.dart';
import 'package:wound_insight_app/models/analysis_result.dart';
import 'package:wound_insight_app/models/etiology_diagnostics.dart';
import 'package:wound_insight_app/models/explainability_attribution.dart';
import 'package:wound_insight_app/models/safety_qa.dart';
import 'package:wound_insight_app/models/severity_assessment.dart';
import 'package:wound_insight_app/models/tissue_composition.dart';
import 'package:wound_insight_app/models/visual_outputs.dart';
import 'package:wound_insight_app/models/wound_morphometrics.dart';
import 'package:wound_insight_app/providers/core_providers.dart';
import 'package:wound_insight_app/repositories/analysis_repository.dart';

class MockAnalysisRepository extends Mock implements AnalysisRepository {}

void main() {
  late MockAnalysisRepository mockRepo;

  setUp(() {
    mockRepo = MockAnalysisRepository();
    when(() => mockRepo.getOriginalImageUrl(any())).thenReturn('http://test.url/orig.png');
    when(() => mockRepo.getGradCamImageUrl(any())).thenReturn('http://test.url/cam.png');
    when(() => mockRepo.getReportImageUrl(any())).thenReturn('http://test.url/report.png');
    when(() => mockRepo.getOriginalImageBytes(any())).thenAnswer((_) async => Uint8List.fromList([1, 2, 3]));
    when(() => mockRepo.getGradCamBytes(any())).thenAnswer((_) async => Uint8List.fromList([1, 2, 3]));
    when(() => mockRepo.getReportImageBytes(any())).thenAnswer((_) async => Uint8List.fromList([1, 2, 3]));
  });

  Widget createWidgetUnderTest(AnalysisResult data) {
    return ProviderScope(
      overrides: [
        analysisRepositoryProvider.overrideWithValue(mockRepo),
      ],
      child: MaterialApp(
        home: ResultsScreen(
          analysisId: data.analysisId,
          initialData: data,
        ),
      ),
    );
  }

  group('ResultsScreen Widget Tests', () {
    testWidgets('(a) renders all sections for a full data response', (tester) async {
      const fullData = AnalysisResult(
        analysisId: 'analysis-full-001',
        status: 'success',
        timestamp: '2026-09-13T10:00:00Z',
        originalFilename: 'wound_sample.png',
        wound: WoundMorphometrics(
          detected: true,
          areaPixels: 2500,
          areaCm2: 1.45,
          perimeterMm: 35.0,
          circularity: 0.88,
          isIrregular: false,
        ),
        tissue: TissueComposition(
          fibrinSloughPercent: 20.0,
          granulationPercent: 70.0,
          callusPercent: 10.0,
        ),
        etiology: EtiologyDiagnostics(
          predictedType: 'Venous Ulcer',
          confidence: 88.5,
          probabilities: EtiologyProbabilities(
            venous: 88.5,
            dfu: 11.5,
            pressure: 0.0,
            surgical: 0.0,
          ),
        ),
        severity: SeverityAssessment(
          severityScore: 14.2,
          severityGrade: 'Low (Mild)',
          recommendedAction: 'Apply gentle compression and manage exudate.',
        ),
        uncertainty: SafetyQA(
          aiConfidenceScore: 92.0,
          requiresClinicianReview: false,
        ),
        visualizations: VisualOutputs(
          reportImageUrl: '/report',
          reportFilename: 'report.png',
          originalImageUrl: '/image',
        ),
        explainability: ExplainabilityAttribution(
          available: true,
          method: 'Grad-CAM (Dual-Branch ResNet34)',
          targetClass: 'Venous Ulcer',
          academicNotice: 'Model feature activation patterns.',
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest(fullData));
      await tester.pump();

      // Section 1: Summary
      expect(find.text('Diagnostic Assessment'), findsOneWidget);
      expect(find.text('Venous Ulcer'), findsOneWidget);
      expect(find.text('88.5%'), findsOneWidget);

      // Section 2: Morphometrics
      expect(find.text('Wound Morphometrics'), findsOneWidget);
      expect(find.text('1.45 cm²'), findsOneWidget);

      // Section 3: Tissue composition
      expect(find.text('Tissue Composition Breakdown'), findsOneWidget);
      expect(find.text('70.0%'), findsOneWidget);

      // Section 4: Treatment recommendation
      expect(find.text('AI System Recommendation'), findsOneWidget);
      expect(find.text('Apply gentle compression and manage exudate.'), findsOneWidget);

      // Section 5: Explainability
      expect(find.text('Model Attention Visualization'), findsOneWidget);

      // Section 6: Original photo
      expect(find.text('Original Photographic Capture'), findsOneWidget);

      // Verify no lesion card is absent
      expect(find.text('No Active Lesion Detected'), findsNothing);
    });

    testWidgets('(b) renders gracefully when optional fields are absent or null', (tester) async {
      const minimalData = AnalysisResult(
        analysisId: 'analysis-min-002',
        status: 'success',
        timestamp: '2026-09-13T10:00:00Z',
        originalFilename: 'wound_minimal.png',
        wound: WoundMorphometrics(
          detected: true,
          areaPixels: 1000,
          areaCm2: 0.5,
          perimeterMm: 12.0,
          circularity: 0.0,
          isIrregular: false,
        ),
        tissue: TissueComposition(
          fibrinSloughPercent: 0.0,
          granulationPercent: 100.0,
          callusPercent: 0.0,
        ),
        etiology: EtiologyDiagnostics(
          predictedType: 'Diabetic Foot Ulcer',
          confidence: 75.0,
          probabilities: EtiologyProbabilities(
            dfu: 75.0,
            pressure: 5.0,
            surgical: 10.0,
            venous: 10.0,
          ),
        ),
        severity: SeverityAssessment(
          severityScore: 25.0,
          severityGrade: 'Moderate',
          recommendedAction: 'Standard routine care advised.',
        ),
        uncertainty: SafetyQA(
          aiConfidenceScore: 80.0,
          requiresClinicianReview: true,
        ),
        visualizations: VisualOutputs(
          reportImageUrl: '/report',
          reportFilename: 'report.png',
          originalImageUrl: '/image',
        ),
        explainability: null, // null explainability
      );

      await tester.pumpWidget(createWidgetUnderTest(minimalData));
      await tester.pump();

      expect(find.text('Diagnostic Assessment'), findsOneWidget);
      expect(find.text('Diabetic Foot Ulcer'), findsOneWidget);
      expect(find.text('Wound Morphometrics'), findsOneWidget);
      // Explainability section is absent
      expect(find.text('Model Attention Visualization'), findsNothing);
    });

    testWidgets('(c) strictly omits measurement and treatment sections when No Active Lesion Detected', (tester) async {
      const noLesionData = AnalysisResult(
        analysisId: 'analysis-blank-003',
        status: 'success',
        timestamp: '2026-09-13T10:00:00Z',
        originalFilename: 'blank_skin.png',
        wound: WoundMorphometrics(
          detected: false, // NOT DETECTED
          areaPixels: 0,
          areaCm2: 0.0,
          perimeterMm: 0.0,
          circularity: 0.0,
          isIrregular: false,
        ),
        tissue: TissueComposition(
          fibrinSloughPercent: 0.0,
          granulationPercent: 0.0,
          callusPercent: 0.0,
        ),
        etiology: EtiologyDiagnostics(
          predictedType: 'Surgical Wound',
          confidence: 80.0,
          probabilities: EtiologyProbabilities(
            dfu: 5.0,
            pressure: 5.0,
            surgical: 80.0,
            venous: 10.0,
          ),
        ),
        severity: SeverityAssessment(
          severityScore: 0.0,
          severityGrade: 'No Active Lesion Detected',
          recommendedAction: 'No active wound bed delineated.',
        ),
        uncertainty: SafetyQA(
          aiConfidenceScore: 100.0,
          requiresClinicianReview: false,
        ),
        visualizations: VisualOutputs(
          reportImageUrl: '/report',
          reportFilename: 'report.png',
          originalImageUrl: '/image',
        ),
        explainability: null,
      );

      await tester.pumpWidget(createWidgetUnderTest(noLesionData));
      await tester.pump();

      // "No Active Lesion Detected" must be present
      expect(find.text('No Active Lesion Detected'), findsWidgets);

      // Section 2: Morphometrics MUST BE ABSENT
      expect(find.text('Wound Morphometrics'), findsNothing);

      // Section 3: Tissue composition MUST BE ABSENT
      expect(find.text('Tissue Composition Breakdown'), findsNothing);

      // Section 4: Treatment recommendation MUST BE ABSENT
      expect(find.text('AI System Recommendation'), findsNothing);
    });
  });
}
