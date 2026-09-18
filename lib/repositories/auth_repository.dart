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
    await _tokenStorage.saveCachedUser(token.user);
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
    await _tokenStorage.saveCachedUser(token.user);
    return token.user;
  }

  Future<User?> tryAutoLogin() async {
    final hasToken = await _tokenStorage.hasToken();
    if (!hasToken) return null;
    
    // Fast-boot: Return cached user immediately instead of blocking on /auth/me.
    final cachedUser = await _tokenStorage.getCachedUser();
    if (cachedUser != null) {
      return cachedUser;
    }
    
    // Fallback if token exists but no cached user (e.g. migration)
    final user = await _apiService.getCurrentUser();
    await _tokenStorage.saveCachedUser(user);
    return user;
  }

  Future<void> logout() async {
    await _tokenStorage.deleteToken();
    await _tokenStorage.deleteCachedUser();
  }

  Future<bool> isAuthenticated() async {
    return await _tokenStorage.hasToken();
  }
}
