import 'package:freezed_annotation/freezed_annotation.dart';

part 'visual_outputs.freezed.dart';
part 'visual_outputs.g.dart';

@freezed
class VisualOutputs with _$VisualOutputs {
  const factory VisualOutputs({
    @JsonKey(name: 'report_image_url') required String reportImageUrl,
    @JsonKey(name: 'report_filename') required String reportFilename,
    @JsonKey(name: 'original_image_url') String? originalImageUrl,
    @JsonKey(name: 'gradcam_image_url') String? gradcamImageUrl,
  }) = _VisualOutputs;

  factory VisualOutputs.fromJson(Map<String, dynamic> json) =>
      _$VisualOutputsFromJson(json);
}
