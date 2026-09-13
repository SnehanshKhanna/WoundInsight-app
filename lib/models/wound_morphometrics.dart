import 'package:freezed_annotation/freezed_annotation.dart';

part 'wound_morphometrics.freezed.dart';
part 'wound_morphometrics.g.dart';

@freezed
class WoundMorphometrics with _$WoundMorphometrics {
  const factory WoundMorphometrics({
    required bool detected,
    @JsonKey(name: 'area_pixels') required int areaPixels,
    @JsonKey(name: 'area_cm2') required double areaCm2,
    @JsonKey(name: 'perimeter_mm') required double perimeterMm,
    required double circularity,
    @JsonKey(name: 'is_irregular') required bool isIrregular,
  }) = _WoundMorphometrics;

  factory WoundMorphometrics.fromJson(Map<String, dynamic> json) =>
      _$WoundMorphometricsFromJson(json);
}
