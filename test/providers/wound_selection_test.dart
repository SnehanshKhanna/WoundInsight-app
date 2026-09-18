import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wound_insight_app/models/user.dart';
import 'package:wound_insight_app/models/wound.dart';
import 'package:wound_insight_app/providers/auth_providers.dart';
import 'package:wound_insight_app/providers/core_providers.dart';
import 'package:wound_insight_app/providers/wound_providers.dart';
import 'package:wound_insight_app/repositories/wound_repository.dart';

class MockWoundRepository extends Mock implements WoundRepository {}

void main() {
  late MockWoundRepository mockRepo;
  late ProviderContainer container;
  
  const woundA = Wound(id: 'w-1', userId: 'u-1', name: 'Wound A', createdAt: '2026-09-15');
  const woundB = Wound(id: 'w-2', userId: 'u-1', name: 'Wound B', createdAt: '2026-09-15');
  const woundC = Wound(id: 'w-3', userId: 'u-2', name: 'Wound C', createdAt: '2026-09-16');

  setUp(() {
    mockRepo = MockWoundRepository();
  });
  
  test('selectedWoundProvider persists selection across rebuilds and scopes correctly', () async {
    when(() => mockRepo.getWounds()).thenAnswer((_) async => [woundA, woundB]);
    
    final userProvider = StateProvider<User?>((ref) => null);
    
    container = ProviderContainer(
      overrides: [
        woundRepositoryProvider.overrideWithValue(mockRepo),
        currentUserProvider.overrideWith((ref) => ref.watch(userProvider)),
      ],
    );

    // 10. User A logs in
    container.read(userProvider.notifier).state = const User(id: 'u-1', email: 'a@a.com', name: 'A', createdAt: '2026-09-15');
    
    // Wait for wounds to load
    await container.read(woundListProvider.notifier).fetchWounds();
    
    // Default selection should be the first wound (Wound A)
    var selectedWound = container.read(selectedWoundProvider);
    expect(selectedWound?.id, woundA.id);

    // 2. Select wound B
    container.read(selectedWoundIdProvider.notifier).state = woundB.id;
    selectedWound = container.read(selectedWoundProvider);
    expect(selectedWound?.id, woundB.id);

    // 6. Refresh/rebuild Progress (simulate woundListProvider refreshing)
    await container.read(woundListProvider.notifier).fetchWounds();
    
    // 7. Wound B remains selected
    selectedWound = container.read(selectedWoundProvider);
    expect(selectedWound?.id, woundB.id);
    
    // 9. If selected wound is deleted/invalid, fallback works
    when(() => mockRepo.getWounds()).thenAnswer((_) async => [woundA]); // Wound B deleted
    await container.read(woundListProvider.notifier).fetchWounds();
    selectedWound = container.read(selectedWoundProvider);
    expect(selectedWound?.id, woundA.id); // Falls back to first available

    // 10. Logout clears the selected-wound state
    container.read(userProvider.notifier).state = null;
    final selectedId = container.read(selectedWoundIdProvider);
    expect(selectedId, null);

    // 11. User B logs in, should not inherit User A's selected wound
    when(() => mockRepo.getWounds()).thenAnswer((_) async => [woundC]);
    container.read(userProvider.notifier).state = const User(id: 'u-2', email: 'b@b.com', name: 'B', createdAt: '2026-09-16');
    await container.read(woundListProvider.notifier).fetchWounds();
    
    selectedWound = container.read(selectedWoundProvider);
    expect(selectedWound?.id, woundC.id);
    expect(container.read(selectedWoundIdProvider), null);
  });
}
