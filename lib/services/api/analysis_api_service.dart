import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:wound_insight_app/core/network/api_client.dart';
import 'package:wound_insight_app/models/analysis_result.dart';
import 'package:wound_insight_app/models/analysis_list_response.dart';

class AnalysisApiService {
  final ApiClient _client;

  AnalysisApiService(this._client);

  Future<AnalysisResult> uploadAndAnalyze({
    required String filePath,
    required String woundId,
    CancelToken? cancelToken,
  }) async {
    try {
      final fileName = filePath.split(RegExp(r'[\\/]')).last;
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(filePath, filename: fileName),
        'wound_id': woundId,
      });

      final response = await _client.dio.post(
        '/api/v1/analyses',
        data: formData,
        cancelToken: cancelToken,
      );
      return AnalysisResult.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw _client.handleDioError(e);
    }
  }

  Future<AnalysisResult> getAnalysisById(String analysisId) async {
    try {
      final response = await _client.dio.get('/api/v1/analyses/$analysisId');
      return AnalysisResult.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw _client.handleDioError(e);
    }
  }

  Future<AnalysisListResponse> listAnalyses({
    int limit = 20,
    int offset = 0,
    String? woundId,
  }) async {
    try {
      final response = await _client.dio.get(
        '/api/v1/analyses',
        queryParameters: {
          'limit': limit,
          'offset': offset,
          'wound_id': ?woundId,
        },
      );
      return AnalysisListResponse.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw _client.handleDioError(e);
    }
  }

  Future<Uint8List> getOriginalImageBytes(String analysisId) async {
    try {
      final response = await _client.dio.get<List<int>>(
        '/api/v1/analyses/$analysisId/image',
        options: Options(responseType: ResponseType.bytes),
      );
      return Uint8List.fromList(response.data!);
    } catch (e) {
      throw _client.handleDioError(e);
    }
  }

  Future<Uint8List> getGradCamBytes(String analysisId) async {
    try {
      final response = await _client.dio.get<List<int>>(
        '/api/v1/analyses/$analysisId/gradcam',
        options: Options(responseType: ResponseType.bytes),
      );
      return Uint8List.fromList(response.data!);
    } catch (e) {
      throw _client.handleDioError(e);
    }
  }

  Future<Uint8List> getReportImageBytes(String analysisId) async {
    try {
      final response = await _client.dio.get<List<int>>(
        '/api/v1/analyses/$analysisId/report',
        options: Options(responseType: ResponseType.bytes),
      );
      return Uint8List.fromList(response.data!);
    } catch (e) {
      throw _client.handleDioError(e);
    }
  }

  String buildOriginalImageUrl(String analysisId) {
    return '${_client.dio.options.baseUrl}/api/v1/analyses/$analysisId/image';
  }

  String buildReportImageUrl(String analysisId) {
    return '${_client.dio.options.baseUrl}/api/v1/analyses/$analysisId/report';
  }

  String buildGradCamImageUrl(String analysisId) {
    return '${_client.dio.options.baseUrl}/api/v1/analyses/$analysisId/gradcam';
  }
}
