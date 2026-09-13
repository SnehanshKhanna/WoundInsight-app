import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wound_insight_app/models/wound_morphometrics.dart';
import 'package:wound_insight_app/models/tissue_composition.dart';
import 'package:wound_insight_app/models/etiology_diagnostics.dart';
import 'package:wound_insight_app/models/severity_assessment.dart';
import 'package:wound_insight_app/models/safety_qa.dart';
import 'package:wound_insight_app/models/visual_outputs.dart';
import 'package:wound_insight_app/models/explainability_attribution.dart';

part 'analysis_result.freezed.dart';
part 'analysis_result.g.dart';

@freezed
class AnalysisResult with _$AnalysisResult {
  const factory AnalysisResult({
    @JsonKey(name: 'analysis_id') required String analysisId,
    @Default('success') String status,
    required String timestamp,
    @JsonKey(name: 'original_filename') required String originalFilename,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'wound_id') String? woundId,
    required WoundMorphometrics wound,
    required TissueComposition tissue,
    required EtiologyDiagnostics etiology,
    required SeverityAssessment severity,
    required SafetyQA uncertainty,
    required VisualOutputs visualizations,
    ExplainabilityAttribution? explainability,
    @JsonKey(name: 'academic_notice') String? academicNotice,
  }) = _AnalysisResult;

  factory AnalysisResult.fromJson(Map<String, dynamic> json) =>
      _$AnalysisResultFromJson(json);
}

extension AnalysisResultX on AnalysisResult {
  bool get isLesionDetected =>
      wound.detected && !severity.severityGrade.toLowerCase().contains('no active lesion');
}

