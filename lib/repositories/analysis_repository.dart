import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:wound_insight_app/models/analysis_result.dart';
import 'package:wound_insight_app/models/analysis_list_response.dart';
import 'package:wound_insight_app/services/api/analysis_api_service.dart';

class AnalysisRepository {
  final AnalysisApiService _apiService;

  AnalysisRepository(this._apiService);

  Future<AnalysisResult> analyzeWoundImage({
    required String filePath,
    required String woundId,
    CancelToken? cancelToken,
  }) async {
    return await _apiService.uploadAndAnalyze(
      filePath: filePath,
      woundId: woundId,
      cancelToken: cancelToken,
    );
  }

  Future<AnalysisResult> getAnalysisById(String analysisId) async {
    return await _apiService.getAnalysisById(analysisId);
  }

  Future<AnalysisListResponse> getUserAnalyses({
    int limit = 50,
    int offset = 0,
    String? woundId,
  }) async {
    return await _apiService.listAnalyses(
      limit: limit,
      offset: offset,
      woundId: woundId,
    );
  }

  Future<Uint8List> getOriginalImageBytes(String analysisId) async {
    return await _apiService.getOriginalImageBytes(analysisId);
  }

  Future<Uint8List> getGradCamBytes(String analysisId) async {
    return await _apiService.getGradCamBytes(analysisId);
  }

  Future<Uint8List> getReportImageBytes(String analysisId) async {
    return await _apiService.getReportImageBytes(analysisId);
  }

  String getOriginalImageUrl(String analysisId) {
    return _apiService.buildOriginalImageUrl(analysisId);
  }

  String getReportImageUrl(String analysisId) {
    return _apiService.buildReportImageUrl(analysisId);
  }

  String getGradCamImageUrl(String analysisId) {
    return _apiService.buildGradCamImageUrl(analysisId);
  }
}
