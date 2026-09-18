import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:wound_insight_app/providers/auth_providers.dart';
import 'package:wound_insight_app/core/network/api_exceptions.dart';
import 'package:wound_insight_app/repositories/auth_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockRepo;
  late StreamController<void> unauthorizedController;
  late AuthNotifier notifier;

  setUp(() {
    mockRepo = MockAuthRepository();
    unauthorizedController = StreamController<void>.broadcast();
  });

  tearDown(() {
    unauthorizedController.close();
  });

  test('AuthNotifier checkAuthStatus handles transient errors by keeping session', () async {
    // 1. Simulate network timeout during fallback API call
    when(() => mockRepo.tryAutoLogin()).thenThrow(TimeoutException('Network timeout'));

    notifier = AuthNotifier(
      repository: mockRepo,
      onUnauthorized: unauthorizedController.stream,
    );

    // Give microtasks time to run (since checkAuthStatus is called in constructor)
    await Future.delayed(Duration.zero);

    // It should NOT be unauthenticated
    expect(notifier.state.status, AuthStatus.authenticated);
    expect(notifier.state.user?.id, 'offline_user');
  });

  test('AuthNotifier checkAuthStatus logs out on 401 Unauthorized', () async {
    // 1. Simulate 401 during fallback API call
    when(() => mockRepo.tryAutoLogin()).thenThrow(UnauthorizedException('Token expired'));

    notifier = AuthNotifier(
      repository: mockRepo,
      onUnauthorized: unauthorizedController.stream,
    );

    await Future.delayed(Duration.zero);

    // It should force logout
    expect(notifier.state.status, AuthStatus.unauthenticated);
    expect(notifier.state.user, isNull);
  });
}
