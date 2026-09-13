// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wound_morphometrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WoundMorphometricsImpl _$$WoundMorphometricsImplFromJson(
  Map<String, dynamic> json,
) => _$WoundMorphometricsImpl(
  detected: json['detected'] as bool,
  areaPixels: (json['area_pixels'] as num).toInt(),
  areaCm2: (json['area_cm2'] as num).toDouble(),
  perimeterMm: (json['perimeter_mm'] as num).toDouble(),
  circularity: (json['circularity'] as num).toDouble(),
  isIrregular: json['is_irregular'] as bool,
);

Map<String, dynamic> _$$WoundMorphometricsImplToJson(
  _$WoundMorphometricsImpl instance,
) => <String, dynamic>{
  'detected': instance.detected,
  'area_pixels': instance.areaPixels,
  'area_cm2': instance.areaCm2,
  'perimeter_mm': instance.perimeterMm,
  'circularity': instance.circularity,
  'is_irregular': instance.isIrregular,
};
