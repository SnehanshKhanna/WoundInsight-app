import 'package:freezed_annotation/freezed_annotation.dart';

part 'explainability_attribution.freezed.dart';
part 'explainability_attribution.g.dart';

@freezed
class ExplainabilityAttribution with _$ExplainabilityAttribution {
  const factory ExplainabilityAttribution({
    @Default(false) bool available,
    @Default('Grad-CAM (Dual-Branch ResNet34)') String method,
    @JsonKey(name: 'target_class') String? targetClass,
    @JsonKey(name: 'global_target_layer') String? globalTargetLayer,
    @JsonKey(name: 'roi_target_layer') String? roiTargetLayer,
    @JsonKey(name: 'fusion_method') String? fusionMethod,
    @JsonKey(name: 'academic_notice') String? academicNotice,
  }) = _ExplainabilityAttribution;

  factory ExplainabilityAttribution.fromJson(Map<String, dynamic> json) =>
      _$ExplainabilityAttributionFromJson(json);
}
