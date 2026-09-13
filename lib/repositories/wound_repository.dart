import 'package:wound_insight_app/models/wound.dart';
import 'package:wound_insight_app/services/api/wound_api_service.dart';

class WoundRepository {
  final WoundApiService _apiService;

  WoundRepository(this._apiService);

  Future<Wound> createWound({
    required String name,
    String? location,
  }) async {
    return await _apiService.createWound(name: name, location: location);
  }

  Future<List<Wound>> getWounds() async {
    return await _apiService.listWounds();
  }

  Future<Wound> getWoundById(String id) async {
    return await _apiService.getWoundById(id);
  }
}
