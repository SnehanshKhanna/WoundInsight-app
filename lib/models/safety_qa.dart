import 'package:freezed_annotation/freezed_annotation.dart';

part 'safety_qa.freezed.dart';
part 'safety_qa.g.dart';

@freezed
class SafetyQA with _$SafetyQA {
  const factory SafetyQA({
    @JsonKey(name: 'ai_confidence_score') required double aiConfidenceScore,
    @JsonKey(name: 'requires_clinician_review') required bool requiresClinicianReview,
  }) = _SafetyQA;

  factory SafetyQA.fromJson(Map<String, dynamic> json) => _$SafetyQAFromJson(json);
}
