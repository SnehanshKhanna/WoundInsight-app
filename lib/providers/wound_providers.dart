import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/models/wound.dart';
import 'package:wound_insight_app/providers/core_providers.dart';
import 'package:wound_insight_app/repositories/wound_repository.dart';

class WoundListNotifier extends StateNotifier<AsyncValue<List<Wound>>> {
  final WoundRepository _repository;

  WoundListNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchWounds();
  }

  Future<void> fetchWounds() async {
    state = const AsyncValue.loading();
    try {
      final wounds = await _repository.getWounds();
      state = AsyncValue.data(wounds);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<Wound?> createWound({required String name, String? location}) async {
    try {
      final newWound = await _repository.createWound(name: name, location: location);
      final currentList = state.value ?? [];
      state = AsyncValue.data([newWound, ...currentList]);
      return newWound;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }
}

final woundListProvider =
    StateNotifierProvider<WoundListNotifier, AsyncValue<List<Wound>>>((ref) {
  final repo = ref.watch(woundRepositoryProvider);
  return WoundListNotifier(repo);
});

final selectedWoundIdProvider = StateProvider<String?>((ref) {
  final wounds = ref.watch(woundListProvider).value;
  if (wounds != null && wounds.isNotEmpty) {
    return wounds.first.id;
  }
  return null;
});

final selectedWoundProvider = Provider<Wound?>((ref) {
  final selectedId = ref.watch(selectedWoundIdProvider);
  final wounds = ref.watch(woundListProvider).value;
  if (wounds == null || wounds.isEmpty) return null;
  if (selectedId == null) return wounds.first;
  try {
    return wounds.firstWhere((w) => w.id == selectedId);
  } catch (_) {
    return wounds.first;
  }
});
