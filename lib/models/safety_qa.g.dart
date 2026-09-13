// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safety_qa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SafetyQAImpl _$$SafetyQAImplFromJson(Map<String, dynamic> json) =>
    _$SafetyQAImpl(
      aiConfidenceScore: (json['ai_confidence_score'] as num).toDouble(),
      requiresClinicianReview: json['requires_clinician_review'] as bool,
    );

Map<String, dynamic> _$$SafetyQAImplToJson(_$SafetyQAImpl instance) =>
    <String, dynamic>{
      'ai_confidence_score': instance.aiConfidenceScore,
      'requires_clinician_review': instance.requiresClinicianReview,
    };
