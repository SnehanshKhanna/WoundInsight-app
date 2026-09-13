import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wound_insight_app/models/analysis_summary_item.dart';

part 'analysis_list_response.freezed.dart';
part 'analysis_list_response.g.dart';

@freezed
class AnalysisListResponse with _$AnalysisListResponse {
  const factory AnalysisListResponse({
    required int total,
    required int limit,
    required int offset,
    required List<AnalysisSummaryItem> analyses,
  }) = _AnalysisListResponse;

  factory AnalysisListResponse.fromJson(Map<String, dynamic> json) =>
      _$AnalysisListResponseFromJson(json);
}
