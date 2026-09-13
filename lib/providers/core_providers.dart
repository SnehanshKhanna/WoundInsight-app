import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wound_insight_app/core/config/app_config.dart';
import 'package:wound_insight_app/core/network/api_client.dart';
import 'package:wound_insight_app/services/api/auth_api_service.dart';
import 'package:wound_insight_app/services/api/wound_api_service.dart';
import 'package:wound_insight_app/services/api/analysis_api_service.dart';
import 'package:wound_insight_app/services/auth/token_storage_service.dart';
import 'package:wound_insight_app/services/image/image_capture_service.dart';
import 'package:wound_insight_app/repositories/auth_repository.dart';
import 'package:wound_insight_app/repositories/wound_repository.dart';
import 'package:wound_insight_app/repositories/analysis_repository.dart';

// Must be overridden in ProviderScope at main()
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider must be overridden at startup');
});

final appConfigProvider = Provider<AppConfig>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return AppConfig(prefs);
});

final tokenStorageProvider = Provider<TokenStorageService>((ref) {
  return TokenStorageService();
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final config = ref.watch(appConfigProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  final client = ApiClient(config: config, tokenStorage: tokenStorage);

  ref.onDispose(() {
    client.dispose();
  });

  return client;
});

// API Services
final authApiServiceProvider = Provider<AuthApiService>((ref) {
  final client = ref.watch(apiClientProvider);
  return AuthApiService(client);
});

final woundApiServiceProvider = Provider<WoundApiService>((ref) {
  final client = ref.watch(apiClientProvider);
  return WoundApiService(client);
});

final analysisApiServiceProvider = Provider<AnalysisApiService>((ref) {
  final client = ref.watch(apiClientProvider);
  return AnalysisApiService(client);
});

final imageCaptureServiceProvider = Provider<ImageCaptureService>((ref) {
  return ImageCaptureService();
});

// Repositories
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final api = ref.watch(authApiServiceProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  return AuthRepository(apiService: api, tokenStorage: tokenStorage);
});

final woundRepositoryProvider = Provider<WoundRepository>((ref) {
  final api = ref.watch(woundApiServiceProvider);
  return WoundRepository(api);
});

final analysisRepositoryProvider = Provider<AnalysisRepository>((ref) {
  final api = ref.watch(analysisApiServiceProvider);
  return AnalysisRepository(api);
});
