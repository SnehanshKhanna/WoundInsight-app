import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_summary_item.freezed.dart';
part 'analysis_summary_item.g.dart';

@freezed
class AnalysisSummaryItem with _$AnalysisSummaryItem {
  const factory AnalysisSummaryItem({
    @JsonKey(name: 'analysis_id') required String analysisId,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'original_filename') required String originalFilename,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'wound_id') String? woundId,
    @JsonKey(name: 'predicted_etiology') required String predictedEtiology,
    @JsonKey(name: 'etiology_confidence') required double etiologyConfidence,
    @JsonKey(name: 'wound_area_cm2') required double woundAreaCm2,
    @JsonKey(name: 'severity_grade') required String severityGrade,
    @JsonKey(name: 'severity_score') required double severityScore,
    @JsonKey(name: 'ai_confidence_score') required double aiConfidenceScore,
    @JsonKey(name: 'clinician_review_flag') required bool clinicianReviewFlag,
    @JsonKey(name: 'report_image_url') required String reportImageUrl,
  }) = _AnalysisSummaryItem;

  factory AnalysisSummaryItem.fromJson(Map<String, dynamic> json) =>
      _$AnalysisSummaryItemFromJson(json);
}
