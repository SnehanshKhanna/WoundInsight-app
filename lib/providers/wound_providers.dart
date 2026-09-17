import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/models/wound.dart';
import 'package:wound_insight_app/providers/core_providers.dart';
import 'package:wound_insight_app/repositories/wound_repository.dart';
import 'package:wound_insight_app/models/user.dart';
import 'package:wound_insight_app/providers/auth_providers.dart';

class WoundListNotifier extends StateNotifier<AsyncValue<List<Wound>>> {
  final WoundRepository _repository;
  final User? _user;

  WoundListNotifier(this._repository, this._user) : super(const AsyncValue.loading()) {
    if (_user != null) {
      fetchWounds();
    } else {
      state = const AsyncValue.data([]);
    }
  }

  Future<void> fetchWounds() async {
    if (_user == null) {
      state = const AsyncValue.data([]);
      return;
    }
    state = const AsyncValue.loading();
    try {
      final wounds = await _repository.getWounds();
      state = AsyncValue.data(wounds);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<Wound?> createWound({required String name, String? location}) async {
    if (_user == null) return null;
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
  final user = ref.watch(currentUserProvider);
  final repo = ref.watch(woundRepositoryProvider);
  return WoundListNotifier(repo, user);
});

final selectedWoundIdProvider = StateProvider<String?>((ref) {
  // Watch the user provider so that this state clears when the user logs out
  ref.watch(currentUserProvider);
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
