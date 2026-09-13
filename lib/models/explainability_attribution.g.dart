// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explainability_attribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExplainabilityAttributionImpl _$$ExplainabilityAttributionImplFromJson(
  Map<String, dynamic> json,
) => _$ExplainabilityAttributionImpl(
  available: json['available'] as bool? ?? false,
  method: json['method'] as String? ?? 'Grad-CAM (Dual-Branch ResNet34)',
  targetClass: json['target_class'] as String?,
  globalTargetLayer: json['global_target_layer'] as String?,
  roiTargetLayer: json['roi_target_layer'] as String?,
  fusionMethod: json['fusion_method'] as String?,
  academicNotice: json['academic_notice'] as String?,
);

Map<String, dynamic> _$$ExplainabilityAttributionImplToJson(
  _$ExplainabilityAttributionImpl instance,
) => <String, dynamic>{
  'available': instance.available,
  'method': instance.method,
  'target_class': instance.targetClass,
  'global_target_layer': instance.globalTargetLayer,
  'roi_target_layer': instance.roiTargetLayer,
  'fusion_method': instance.fusionMethod,
  'academic_notice': instance.academicNotice,
};
