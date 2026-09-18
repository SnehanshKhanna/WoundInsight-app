import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wound_insight_app/models/user.dart';

class TokenStorageService {
  static const String _keyToken = 'woundinsight_auth_token_jwt';
  static const String _keyCachedUser = 'woundinsight_cached_user_profile';

  final FlutterSecureStorage _storage;

  TokenStorageService({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(encryptedSharedPreferences: true),
              iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
            );

  Future<void> saveToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _keyToken);
  }

  Future<bool> hasToken() async {
    final t = await getToken();
    return t != null && t.isNotEmpty;
  }

  Future<void> saveCachedUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyCachedUser, jsonEncode(user.toJson()));
  }

  Future<User?> getCachedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJsonStr = prefs.getString(_keyCachedUser);
    if (userJsonStr != null && userJsonStr.isNotEmpty) {
      try {
        return User.fromJson(jsonDecode(userJsonStr));
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<void> deleteCachedUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyCachedUser);
  }
}
