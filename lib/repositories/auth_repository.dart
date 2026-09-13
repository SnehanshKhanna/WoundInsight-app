import 'package:wound_insight_app/models/user.dart';
import 'package:wound_insight_app/services/api/auth_api_service.dart';
import 'package:wound_insight_app/services/auth/token_storage_service.dart';

class AuthRepository {
  final AuthApiService _apiService;
  final TokenStorageService _tokenStorage;

  AuthRepository({
    required AuthApiService apiService,
    required TokenStorageService tokenStorage,
  })  : _apiService = apiService,
        _tokenStorage = tokenStorage;

  Future<User> register({
    required String email,
    required String password,
    String? name,
  }) async {
    final token = await _apiService.register(
      email: email,
      password: password,
      name: name,
    );
    await _tokenStorage.saveToken(token.accessToken);
    return token.user;
  }

  Future<User> login({
    required String email,
    required String password,
  }) async {
    final token = await _apiService.login(
      email: email,
      password: password,
    );
    await _tokenStorage.saveToken(token.accessToken);
    return token.user;
  }

  Future<User?> tryAutoLogin() async {
    final hasToken = await _tokenStorage.hasToken();
    if (!hasToken) return null;
    try {
      return await _apiService.getCurrentUser();
    } catch (_) {
      await _tokenStorage.deleteToken();
      return null;
    }
  }

  Future<void> logout() async {
    await _tokenStorage.deleteToken();
  }

  Future<bool> isAuthenticated() async {
    return await _tokenStorage.hasToken();
  }
}
