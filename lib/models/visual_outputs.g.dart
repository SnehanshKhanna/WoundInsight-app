// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visual_outputs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisualOutputsImpl _$$VisualOutputsImplFromJson(Map<String, dynamic> json) =>
    _$VisualOutputsImpl(
      reportImageUrl: json['report_image_url'] as String,
      reportFilename: json['report_filename'] as String,
      originalImageUrl: json['original_image_url'] as String?,
      gradcamImageUrl: json['gradcam_image_url'] as String?,
    );

Map<String, dynamic> _$$VisualOutputsImplToJson(_$VisualOutputsImpl instance) =>
    <String, dynamic>{
      'report_image_url': instance.reportImageUrl,
      'report_filename': instance.reportFilename,
      'original_image_url': instance.originalImageUrl,
      'gradcam_image_url': instance.gradcamImageUrl,
    };
