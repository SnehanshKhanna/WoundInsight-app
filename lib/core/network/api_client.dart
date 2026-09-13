import 'dart:async';
import 'package:dio/dio.dart';
import 'package:wound_insight_app/core/config/app_config.dart';
import 'package:wound_insight_app/core/network/api_exceptions.dart';
import 'package:wound_insight_app/services/auth/token_storage_service.dart';

class ApiClient {
  final AppConfig _config;
  final TokenStorageService _tokenStorage;
  late final Dio _dio;

  // Broadcast stream for 401 unauthorized events to force session logout
  final _unauthorizedController = StreamController<void>.broadcast();
  Stream<void> get onUnauthorized => _unauthorizedController.stream;

  ApiClient({
    required AppConfig config,
    required TokenStorageService tokenStorage,
    Dio? customDio,
  })  : _config = config,
        _tokenStorage = tokenStorage {
    _dio = customDio ?? Dio();
    _configureDio();
  }

  Dio get dio => _dio;

  void _configureDio() {
    _dio.options = BaseOptions(
      baseUrl: _config.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 45),
      receiveTimeout: const Duration(seconds: 90), // ML inference allowance
      headers: {
        'Accept': 'application/json',
      },
    );

    _dio.interceptors.clear();

    // 1. Auth Header Interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Update baseUrl dynamically in case it was changed at runtime
          options.baseUrl = _config.baseUrl;

          final token = await _tokenStorage.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          final path = e.requestOptions.path;
          final isAuthEndpoint = path.contains('/auth/login') || path.contains('/auth/register');
          if (e.response?.statusCode == 401 && !isAuthEndpoint) {
            _unauthorizedController.add(null);
          }
          return handler.next(e);
        },
      ),
    );

    // 2. Safe Logging Interceptor (masks credentials and excludes file payloads)
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: false,
        requestBody: false, // Never log full request bodies (contains raw image binary)
        responseHeader: false,
        responseBody: false,
        error: true,
      ),
    );
  }

  AppException handleDioError(dynamic error) {
    if (error is AppException) {
      return error;
    }
    if (error is! DioException) {
      return ServerException(error.toString());
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException("Analysis is taking longer than expected. Please try again.");

      case DioExceptionType.connectionError:
        return NetworkException("Can't reach the WoundInsight server. Check your network or connection settings.");

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;

        String message = "Server returned an error.";
        if (data is Map && data.containsKey('detail')) {
          final detail = data['detail'];
          if (detail is String) {
            message = detail;
          } else if (detail is List && detail.isNotEmpty) {
            final first = detail[0];
            if (first is Map && first.containsKey('msg')) {
              message = first['msg'].toString();
            }
          }
        }

        if (statusCode == 401) {
          return UnauthorizedException(message);
        } else if (statusCode == 404) {
          return NotFoundException(message);
        } else if (statusCode == 422 || statusCode == 400) {
          return ValidationException(message, statusCode: statusCode);
        } else if (statusCode != null && statusCode >= 500) {
          return ServerException("Internal server error during analysis. Please try again shortly.", statusCode);
        }
        return ServerException(message, statusCode);

      case DioExceptionType.cancel:
        return AppException("Request was cancelled.");

      default:
        return NetworkException("Network communication error. Please try again.");
    }
  }

  void dispose() {
    _unauthorizedController.close();
  }
}
