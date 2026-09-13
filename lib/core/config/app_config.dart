import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  static const String _prefKeyBaseUrl = 'woundinsight_custom_api_base_url';

  final SharedPreferences _prefs;
  String _currentBaseUrl;

  AppConfig(this._prefs) : _currentBaseUrl = _resolveInitialUrl(_prefs);

  static String _resolveDefaultBaseUrl() {
    if (kIsWeb) {
      return 'http://localhost:8000';
    }
    if (Platform.isAndroid) {
      // Default to 127.0.0.1:8000 for physical devices with adb reverse port forwarding
      return 'http://127.0.0.1:8000';
    } else if (Platform.isIOS) {
      return 'http://127.0.0.1:8000';
    } else {
      // Windows desktop / macOS / Linux
      return 'http://localhost:8000';
    }
  }

  static String _resolveInitialUrl(SharedPreferences prefs) {
    final saved = prefs.getString(_prefKeyBaseUrl);
    if (saved != null && saved.trim().isNotEmpty) {
      return saved.trim();
    }
    return _resolveDefaultBaseUrl();
  }

  String get baseUrl => _currentBaseUrl;
  String get defaultBaseUrl => _resolveDefaultBaseUrl();

  Future<void> setBaseUrl(String newUrl) async {
    final clean = newUrl.trim().replaceAll(RegExp(r'/+$'), '');
    _currentBaseUrl = clean;
    await _prefs.setString(_prefKeyBaseUrl, clean);
  }

  Future<void> resetToDefault() async {
    _currentBaseUrl = _resolveDefaultBaseUrl();
    await _prefs.remove(_prefKeyBaseUrl);
  }

  /// Tests connectivity against GET /health on the target host
  Future<Map<String, dynamic>> testConnection(String candidateUrl) async {
    final clean = candidateUrl.trim().replaceAll(RegExp(r'/+$'), '');
    final testDio = Dio(
      BaseOptions(
        baseUrl: clean,
        connectTimeout: const Duration(seconds: 4),
        receiveTimeout: const Duration(seconds: 4),
      ),
    );

    try {
      final resp = await testDio.get('/health');
      if (resp.statusCode == 200 && resp.data is Map) {
        return {
          'success': true,
          'message': 'Connected successfully! AI Engine: ${resp.data["status"] ?? "ready"}',
          'device': resp.data['device'] ?? 'unknown',
          'gpu': resp.data['gpu_name'],
        };
      }
      return {
        'success': false,
        'message': 'Server responded with status code ${resp.statusCode}',
      };
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.message ?? 'Unable to connect to $clean. Check IP/port and firewall.',
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Connection error: $e',
      };
    }
  }
}
