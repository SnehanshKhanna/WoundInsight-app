import 'package:wound_insight_app/core/network/api_client.dart';
import 'package:wound_insight_app/models/auth_token.dart';
import 'package:wound_insight_app/models/user.dart';

class AuthApiService {
  final ApiClient _client;

  AuthApiService(this._client);

  Future<AuthToken> register({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final response = await _client.dio.post(
        '/api/v1/auth/register',
        data: {
          'email': email.trim().toLowerCase(),
          'password': password,
          if (name != null && name.trim().isNotEmpty) 'name': name.trim(),
        },
      );
      return AuthToken.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw _client.handleDioError(e);
    }
  }

  Future<AuthToken> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.dio.post(
        '/api/v1/auth/login',
        data: {
          'email': email.trim().toLowerCase(),
          'password': password,
        },
      );
      return AuthToken.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw _client.handleDioError(e);
    }
  }

  Future<User> getCurrentUser() async {
    try {
      final response = await _client.dio.get('/api/v1/auth/me');
      return User.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw _client.handleDioError(e);
    }
  }
}
