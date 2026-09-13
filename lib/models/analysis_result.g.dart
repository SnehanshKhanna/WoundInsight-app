// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalysisResultImpl _$$AnalysisResultImplFromJson(
  Map<String, dynamic> json,
) => _$AnalysisResultImpl(
  analysisId: json['analysis_id'] as String,
  status: json['status'] as String? ?? 'success',
  timestamp: json['timestamp'] as String,
  originalFilename: json['original_filename'] as String,
  userId: json['user_id'] as String?,
  woundId: json['wound_id'] as String?,
  wound: WoundMorphometrics.fromJson(json['wound'] as Map<String, dynamic>),
  tissue: TissueComposition.fromJson(json['tissue'] as Map<String, dynamic>),
  etiology: EtiologyDiagnostics.fromJson(
    json['etiology'] as Map<String, dynamic>,
  ),
  severity: SeverityAssessment.fromJson(
    json['severity'] as Map<String, dynamic>,
  ),
  uncertainty: SafetyQA.fromJson(json['uncertainty'] as Map<String, dynamic>),
  visualizations: VisualOutputs.fromJson(
    json['visualizations'] as Map<String, dynamic>,
  ),
  explainability: json['explainability'] == null
      ? null
      : ExplainabilityAttribution.fromJson(
          json['explainability'] as Map<String, dynamic>,
        ),
  academicNotice: json['academic_notice'] as String?,
);

Map<String, dynamic> _$$AnalysisResultImplToJson(
  _$AnalysisResultImpl instance,
) => <String, dynamic>{
  'analysis_id': instance.analysisId,
  'status': instance.status,
  'timestamp': instance.timestamp,
  'original_filename': instance.originalFilename,
  'user_id': instance.userId,
  'wound_id': instance.woundId,
  'wound': instance.wound,
  'tissue': instance.tissue,
  'etiology': instance.etiology,
  'severity': instance.severity,
  'uncertainty': instance.uncertainty,
  'visualizations': instance.visualizations,
  'explainability': instance.explainability,
  'academic_notice': instance.academicNotice,
};
