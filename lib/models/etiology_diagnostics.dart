import 'package:freezed_annotation/freezed_annotation.dart';

part 'etiology_diagnostics.freezed.dart';
part 'etiology_diagnostics.g.dart';

@freezed
class EtiologyProbabilities with _$EtiologyProbabilities {
  const factory EtiologyProbabilities({
    @JsonKey(name: 'DFU', defaultValue: 0.0) required double dfu,
    @JsonKey(name: 'Pressure', defaultValue: 0.0) required double pressure,
    @JsonKey(name: 'Surgical', defaultValue: 0.0) required double surgical,
    @JsonKey(name: 'Venous', defaultValue: 0.0) required double venous,
  }) = _EtiologyProbabilities;

  factory EtiologyProbabilities.fromJson(Map<String, dynamic> json) =>
      _$EtiologyProbabilitiesFromJson(json);
}

@freezed
class EtiologyDiagnostics with _$EtiologyDiagnostics {
  const factory EtiologyDiagnostics({
    @JsonKey(name: 'predicted_type') required String predictedType,
    required double confidence,
    required EtiologyProbabilities probabilities,
  }) = _EtiologyDiagnostics;

  factory EtiologyDiagnostics.fromJson(Map<String, dynamic> json) =>
      _$EtiologyDiagnosticsFromJson(json);
}
