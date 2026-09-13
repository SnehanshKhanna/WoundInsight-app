import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wound_insight_app/core/network/api_client.dart';
import 'package:wound_insight_app/core/network/api_exceptions.dart';
import 'package:wound_insight_app/services/api/analysis_api_service.dart';
import 'package:wound_insight_app/repositories/analysis_repository.dart';

class MockApiClient extends Mock implements ApiClient {}
class MockDio extends Mock implements Dio {}

void main() {
  late MockApiClient mockClient;
  late MockDio mockDio;
  late AnalysisApiService apiService;
  late AnalysisRepository repository;

  final sampleAnalysisJson = {
    'analysis_id': 'test-123',
    'status': 'success',
    'timestamp': '2026-09-13T16:00:00Z',
    'original_filename': 'test_wound.png',
    'wound': {
      'detected': true,
      'area_pixels': 1500,
      'area_cm2': 1.25,
      'perimeter_mm': 30.0,
      'circularity': 0.85,
      'is_irregular': false,
    },
    'tissue': {
      'fibrin_slough_percent': 10.0,
      'granulation_percent': 80.0,
      'callus_percent': 10.0,
    },
    'etiology': {
      'predicted_type': 'Venous Ulcer',
      'confidence': 91.0,
      'probabilities': {
        'DFU': 0.0,
        'Pressure': 0.0,
        'Surgical': 0.0,
        'Venous': 91.0,
      },
    },
    'severity': {
      'severity_score': 12.0,
      'severity_grade': 'Low (Mild)',
      'recommended_action': 'Protect periwound skin.',
    },
    'uncertainty': {
      'ai_confidence_score': 90.0,
      'requires_clinician_review': false,
    },
    'visualizations': {
      'report_image_url': '/api/v1/analyses/test-123/report',
      'report_filename': 'report_test-123.png',
      'original_image_url': '/api/v1/analyses/test-123/image',
    },
  };

  setUp(() {
    mockClient = MockApiClient();
    mockDio = MockDio();
    when(() => mockClient.dio).thenReturn(mockDio);

    apiService = AnalysisApiService(mockClient);
    repository = AnalysisRepository(apiService);
  });

  group('AnalysisRepository & Service Tests', () {
    test('getAnalysisById returns AnalysisResult on 200 success', () async {
      when(() => mockDio.get('/api/v1/analyses/test-123')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/v1/analyses/test-123'),
          data: sampleAnalysisJson,
          statusCode: 200,
        ),
      );

      final result = await repository.getAnalysisById('test-123');
      expect(result.analysisId, 'test-123');
      expect(result.wound.areaCm2, 1.25);
      expect(result.wound.detected, isTrue);
      expect(result.severity.severityGrade, 'Low (Mild)');
    });

    test('getAnalysisById throws UnauthorizedException on 401 response', () async {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/api/v1/analyses/test-123'),
        response: Response(
          requestOptions: RequestOptions(path: '/api/v1/analyses/test-123'),
          statusCode: 401,
          data: {'detail': 'Invalid authentication token'},
        ),
        type: DioExceptionType.badResponse,
      );

      when(() => mockDio.get('/api/v1/analyses/test-123')).thenThrow(dioException);
      when(() => mockClient.handleDioError(any())).thenReturn(
        UnauthorizedException('Invalid authentication token'),
      );

      expect(
        () => repository.getAnalysisById('test-123'),
        throwsA(isA<UnauthorizedException>()),
      );
    });

    test('getAnalysisById throws TimeoutException on inference timeout', () async {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/api/v1/analyses/test-123'),
        type: DioExceptionType.receiveTimeout,
        message: 'Receive timeout after 90s',
      );

      when(() => mockDio.get('/api/v1/analyses/test-123')).thenThrow(dioException);
      when(() => mockClient.handleDioError(any())).thenReturn(
        TimeoutException('Analysis is taking longer than expected. Please try again.'),
      );

      expect(
        () => repository.getAnalysisById('test-123'),
        throwsA(isA<TimeoutException>()),
      );
    });

    test('getAnalysisById throws ServerException on 500 error', () async {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/api/v1/analyses/test-123'),
        response: Response(
          requestOptions: RequestOptions(path: '/api/v1/analyses/test-123'),
          statusCode: 500,
          data: {'detail': 'Internal server error in segmentation pipeline'},
        ),
        type: DioExceptionType.badResponse,
      );

      when(() => mockDio.get('/api/v1/analyses/test-123')).thenThrow(dioException);
      when(() => mockClient.handleDioError(any())).thenReturn(
        ServerException('Internal server error during analysis. Please try again shortly.', 500),
      );

      expect(
        () => repository.getAnalysisById('test-123'),
        throwsA(isA<ServerException>()),
      );
    });

    test('getUserAnalyses returns AnalysisListResponse on 200', () async {
      final listData = {
        'analyses': [
          {
            'analysis_id': 'test-123',
            'created_at': '2026-09-13T16:00:00Z',
            'original_filename': 'orig.png',
            'wound_id': 'wound-01',
            'predicted_etiology': 'Venous Ulcer',
            'etiology_confidence': 91.0,
            'wound_area_cm2': 1.25,
            'severity_grade': 'Low (Mild)',
            'severity_score': 12.0,
            'ai_confidence_score': 90.0,
            'clinician_review_flag': false,
            'report_image_url': '/api/v1/analyses/test-123/report',
          }
        ],
        'total': 1,
        'limit': 50,
        'offset': 0,
      };

      when(() => mockDio.get(
            '/api/v1/analyses',
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/api/v1/analyses'),
          data: listData,
          statusCode: 200,
        ),
      );

      final response = await repository.getUserAnalyses();
      expect(response.total, 1);
      expect(response.analyses.length, 1);
      expect(response.analyses.first.analysisId, 'test-123');
      expect(response.analyses.first.woundAreaCm2, 1.25);
    });
  });
}
