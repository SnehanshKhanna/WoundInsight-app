import 'package:freezed_annotation/freezed_annotation.dart';

part 'severity_assessment.freezed.dart';
part 'severity_assessment.g.dart';

@freezed
class SeverityAssessment with _$SeverityAssessment {
  const factory SeverityAssessment({
    @JsonKey(name: 'severity_score') required double severityScore,
    @JsonKey(name: 'severity_grade') required String severityGrade,
    @JsonKey(name: 'recommended_action') required String recommendedAction,
  }) = _SeverityAssessment;

  factory SeverityAssessment.fromJson(Map<String, dynamic> json) =>
      _$SeverityAssessmentFromJson(json);
}
