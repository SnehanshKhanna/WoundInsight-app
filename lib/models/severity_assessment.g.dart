// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'severity_assessment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeverityAssessmentImpl _$$SeverityAssessmentImplFromJson(
  Map<String, dynamic> json,
) => _$SeverityAssessmentImpl(
  severityScore: (json['severity_score'] as num).toDouble(),
  severityGrade: json['severity_grade'] as String,
  recommendedAction: json['recommended_action'] as String,
);

Map<String, dynamic> _$$SeverityAssessmentImplToJson(
  _$SeverityAssessmentImpl instance,
) => <String, dynamic>{
  'severity_score': instance.severityScore,
  'severity_grade': instance.severityGrade,
  'recommended_action': instance.recommendedAction,
};
