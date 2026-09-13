import 'package:freezed_annotation/freezed_annotation.dart';

part 'tissue_composition.freezed.dart';
part 'tissue_composition.g.dart';

@freezed
class TissueComposition with _$TissueComposition {
  const factory TissueComposition({
    @JsonKey(name: 'fibrin_slough_percent') required double fibrinSloughPercent,
    @JsonKey(name: 'granulation_percent') required double granulationPercent,
    @JsonKey(name: 'callus_percent') required double callusPercent,
  }) = _TissueComposition;

  factory TissueComposition.fromJson(Map<String, dynamic> json) =>
      _$TissueCompositionFromJson(json);
}
