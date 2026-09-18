import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wound_insight_app/models/user.dart';
import 'package:wound_insight_app/repositories/auth_repository.dart';
import 'package:wound_insight_app/services/api/auth_api_service.dart';
import 'package:wound_insight_app/services/auth/token_storage_service.dart';

class MockAuthApiService extends Mock implements AuthApiService {}
class MockTokenStorageService extends Mock implements TokenStorageService {}

void main() {
  late MockAuthApiService mockApi;
  late MockTokenStorageService mockStorage;
  late AuthRepository repository;
  
  const dummyUser = User(id: 'u-1', email: 'test@test.com', createdAt: '2026-09-18');

  setUp(() {
    mockApi = MockAuthApiService();
    mockStorage = MockTokenStorageService();
    repository = AuthRepository(
      apiService: mockApi,
      tokenStorage: mockStorage,
    );
  });

  group('AuthRepository Fast-Boot Tests', () {
    test('tryAutoLogin immediately proceeds to Login if no token', () async {
      when(() => mockStorage.hasToken()).thenAnswer((_) async => false);
      
      final result = await repository.tryAutoLogin();
      
      expect(result, isNull);
      verifyNever(() => mockStorage.getCachedUser());
      verifyNever(() => mockApi.getCurrentUser());
    });

    test('tryAutoLogin returns cached user instantly without calling /auth/me', () async {
      when(() => mockStorage.hasToken()).thenAnswer((_) async => true);
      when(() => mockStorage.getCachedUser()).thenAnswer((_) async => dummyUser);
      
      final result = await repository.tryAutoLogin();
      
      expect(result, dummyUser);
      // It should NOT call the API!
      verifyNever(() => mockApi.getCurrentUser());
    });

    test('logout clears both token and cached user', () async {
      when(() => mockStorage.deleteToken()).thenAnswer((_) async {});
      when(() => mockStorage.deleteCachedUser()).thenAnswer((_) async {});
      
      await repository.logout();
      
      verify(() => mockStorage.deleteToken()).called(1);
      verify(() => mockStorage.deleteCachedUser()).called(1);
    });
  });
}
