// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_summary_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalysisSummaryItemImpl _$$AnalysisSummaryItemImplFromJson(
  Map<String, dynamic> json,
) => _$AnalysisSummaryItemImpl(
  analysisId: json['analysis_id'] as String,
  createdAt: json['created_at'] as String,
  originalFilename: json['original_filename'] as String,
  userId: json['user_id'] as String?,
  woundId: json['wound_id'] as String?,
  predictedEtiology: json['predicted_etiology'] as String,
  etiologyConfidence: (json['etiology_confidence'] as num).toDouble(),
  woundAreaCm2: (json['wound_area_cm2'] as num).toDouble(),
  severityGrade: json['severity_grade'] as String,
  severityScore: (json['severity_score'] as num).toDouble(),
  aiConfidenceScore: (json['ai_confidence_score'] as num).toDouble(),
  clinicianReviewFlag: json['clinician_review_flag'] as bool,
  reportImageUrl: json['report_image_url'] as String,
);

Map<String, dynamic> _$$AnalysisSummaryItemImplToJson(
  _$AnalysisSummaryItemImpl instance,
) => <String, dynamic>{
  'analysis_id': instance.analysisId,
  'created_at': instance.createdAt,
  'original_filename': instance.originalFilename,
  'user_id': instance.userId,
  'wound_id': instance.woundId,
  'predicted_etiology': instance.predictedEtiology,
  'etiology_confidence': instance.etiologyConfidence,
  'wound_area_cm2': instance.woundAreaCm2,
  'severity_grade': instance.severityGrade,
  'severity_score': instance.severityScore,
  'ai_confidence_score': instance.aiConfidenceScore,
  'clinician_review_flag': instance.clinicianReviewFlag,
  'report_image_url': instance.reportImageUrl,
};
