// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etiology_diagnostics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EtiologyProbabilitiesImpl _$$EtiologyProbabilitiesImplFromJson(
  Map<String, dynamic> json,
) => _$EtiologyProbabilitiesImpl(
  dfu: (json['DFU'] as num?)?.toDouble() ?? 0.0,
  pressure: (json['Pressure'] as num?)?.toDouble() ?? 0.0,
  surgical: (json['Surgical'] as num?)?.toDouble() ?? 0.0,
  venous: (json['Venous'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$$EtiologyProbabilitiesImplToJson(
  _$EtiologyProbabilitiesImpl instance,
) => <String, dynamic>{
  'DFU': instance.dfu,
  'Pressure': instance.pressure,
  'Surgical': instance.surgical,
  'Venous': instance.venous,
};

_$EtiologyDiagnosticsImpl _$$EtiologyDiagnosticsImplFromJson(
  Map<String, dynamic> json,
) => _$EtiologyDiagnosticsImpl(
  predictedType: json['predicted_type'] as String,
  confidence: (json['confidence'] as num).toDouble(),
  probabilities: EtiologyProbabilities.fromJson(
    json['probabilities'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$EtiologyDiagnosticsImplToJson(
  _$EtiologyDiagnosticsImpl instance,
) => <String, dynamic>{
  'predicted_type': instance.predictedType,
  'confidence': instance.confidence,
  'probabilities': instance.probabilities,
};
