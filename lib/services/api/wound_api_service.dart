import 'package:wound_insight_app/core/network/api_client.dart';
import 'package:wound_insight_app/models/wound.dart';

class WoundApiService {
  final ApiClient _client;

  WoundApiService(this._client);

  Future<Wound> createWound({
    required String name,
    String? location,
  }) async {
    try {
      final response = await _client.dio.post(
        '/api/v1/wounds',
        data: {
          'name': name.trim(),
          if (location != null && location.trim().isNotEmpty) 'location': location.trim(),
        },
      );
      return Wound.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw _client.handleDioError(e);
    }
  }

  Future<List<Wound>> listWounds() async {
    try {
      final response = await _client.dio.get('/api/v1/wounds');
      final data = response.data as Map<String, dynamic>;
      final list = data['wounds'] as List<dynamic>;
      return list.map((item) => Wound.fromJson(item as Map<String, dynamic>)).toList();
    } catch (e) {
      throw _client.handleDioError(e);
    }
  }

  Future<Wound> getWoundById(String woundId) async {
    try {
      final response = await _client.dio.get('/api/v1/wounds/$woundId');
      return Wound.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw _client.handleDioError(e);
    }
  }
}
