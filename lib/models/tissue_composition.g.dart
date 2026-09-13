// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tissue_composition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TissueCompositionImpl _$$TissueCompositionImplFromJson(
  Map<String, dynamic> json,
) => _$TissueCompositionImpl(
  fibrinSloughPercent: (json['fibrin_slough_percent'] as num).toDouble(),
  granulationPercent: (json['granulation_percent'] as num).toDouble(),
  callusPercent: (json['callus_percent'] as num).toDouble(),
);

Map<String, dynamic> _$$TissueCompositionImplToJson(
  _$TissueCompositionImpl instance,
) => <String, dynamic>{
  'fibrin_slough_percent': instance.fibrinSloughPercent,
  'granulation_percent': instance.granulationPercent,
  'callus_percent': instance.callusPercent,
};
