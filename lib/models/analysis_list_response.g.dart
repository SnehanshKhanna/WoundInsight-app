// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalysisListResponseImpl _$$AnalysisListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AnalysisListResponseImpl(
  total: (json['total'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  analyses: (json['analyses'] as List<dynamic>)
      .map((e) => AnalysisSummaryItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$AnalysisListResponseImplToJson(
  _$AnalysisListResponseImpl instance,
) => <String, dynamic>{
  'total': instance.total,
  'limit': instance.limit,
  'offset': instance.offset,
  'analyses': instance.analyses,
};
