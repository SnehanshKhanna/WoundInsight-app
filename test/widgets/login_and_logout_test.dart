import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/core/network/api_exceptions.dart';
import 'package:wound_insight_app/features/auth/login_screen.dart';
import 'package:wound_insight_app/features/profile/profile_screen.dart';
import 'package:wound_insight_app/models/user.dart';
import 'package:wound_insight_app/providers/auth_providers.dart';
import 'package:wound_insight_app/repositories/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  bool shouldFailWith401 = false;
  bool shouldFailWithNetwork = false;
  bool logoutCalled = false;
  int loginCallCount = 0;

  static const testUser = User(
    id: 'usr-123',
    email: 'clinician@hospital.org',
    name: 'Dr. Test Clinician',
    createdAt: '2026-09-13T10:00:00Z',
  );

  @override
  Future<User> login({required String email, required String password}) async {
    loginCallCount++;
    if (shouldFailWith401) {
      throw UnauthorizedException('Invalid email or password. Please verify your credentials.');
    }
    if (shouldFailWithNetwork) {
      throw NetworkException("Unable to reach server");
    }
    return testUser;
  }

  @override
  Future<User> register({required String email, required String password, String? name}) async {
    return testUser;
  }

  @override
  Future<User?> tryAutoLogin() async => null;

  @override
  Future<void> logout() async {
    logoutCalled = true;
  }

  @override
  Future<bool> isAuthenticated() async => false;
}

void main() {
  late MockAuthRepository mockRepo;
  late StreamController<void> unauthorizedController;

  setUp(() {
    mockRepo = MockAuthRepository();
    unauthorizedController = StreamController<void>.broadcast();
  });

  tearDown(() {
    unauthorizedController.close();
  });

  Widget createLoginTestWidget() {
    return ProviderScope(
      overrides: [
        authStateProvider.overrideWith((ref) {
          return AuthNotifier(
            repository: mockRepo,
            onUnauthorized: unauthorizedController.stream,
          );
        }),
      ],
      child: const MaterialApp(
        home: LoginScreen(),
      ),
    );
  }

  group('LoginScreen UI & Validation Tests', () {
    testWidgets('server setup icon is NOT present on LoginScreen', (tester) async {
      await tester.pumpWidget(createLoginTestWidget());
      await tester.pump();

      expect(find.byIcon(Icons.dns_outlined), findsNothing);
      expect(find.byIcon(Icons.dns_rounded), findsNothing);
      expect(find.text('Server Settings'), findsNothing);
      expect(find.text('WoundInsight'), findsWidgets);
      expect(find.text('Log In'), findsOneWidget);
    });

    testWidgets('empty email displays validation error without network request', (tester) async {
      await tester.pumpWidget(createLoginTestWidget());
      await tester.pump();

      await tester.tap(find.text('Log In'));
      await tester.pump();

      expect(find.text('Please enter a valid email address.'), findsOneWidget);
      expect(mockRepo.loginCallCount, equals(0));
    });

    testWidgets('malformed email displays validation error without network request', (tester) async {
      await tester.pumpWidget(createLoginTestWidget());
      await tester.pump();

      final textFields = find.byType(TextFormField);
      await tester.enterText(textFields.at(0), 'invalidemail@');
      await tester.tap(find.text('Log In'));
      await tester.pump();

      expect(find.text('Please enter a valid email address.'), findsOneWidget);
      expect(mockRepo.loginCallCount, equals(0));
    });

    testWidgets('empty password displays validation error and preserves email', (tester) async {
      await tester.pumpWidget(createLoginTestWidget());
      await tester.pump();

      final textFields = find.byType(TextFormField);
      await tester.enterText(textFields.at(0), 'clinician@hospital.org');
      await tester.tap(find.text('Log In'));
      await tester.pump();

      expect(find.text('Please enter your password.'), findsOneWidget);
      expect(find.text('clinician@hospital.org'), findsOneWidget);
      expect(mockRepo.loginCallCount, equals(0));
    });

    testWidgets('wrong credentials shows generic error, preserves email, and clears password', (tester) async {
      mockRepo.shouldFailWith401 = true;

      await tester.pumpWidget(createLoginTestWidget());
      await tester.pump();

      final textFields = find.byType(TextFormField);
      await tester.enterText(textFields.at(0), 'clinician@hospital.org');
      await tester.enterText(textFields.at(1), 'wrong_password');

      await tester.tap(find.text('Log In'));
      await tester.pumpAndSettle();

      expect(mockRepo.loginCallCount, equals(1));

      // Check user-friendly error message is displayed
      expect(find.text('Incorrect email or password. Please try again.'), findsWidgets);

      // Verify email was preserved
      expect(find.text('clinician@hospital.org'), findsOneWidget);

      // Verify password was cleared
      expect(find.text('wrong_password'), findsNothing);
    });

    testWidgets('network error shows connection error and preserves inputs', (tester) async {
      mockRepo.shouldFailWithNetwork = true;

      await tester.pumpWidget(createLoginTestWidget());
      await tester.pump();

      final textFields = find.byType(TextFormField);
      await tester.enterText(textFields.at(0), 'clinician@hospital.org');
      await tester.enterText(textFields.at(1), 'mypassword123');

      await tester.tap(find.text('Log In'));
      await tester.pumpAndSettle();

      expect(mockRepo.loginCallCount, equals(1));
      expect(
        find.text('Unable to connect to the server. Please check your connection and try again.'),
        findsWidgets,
      );
      // Email is preserved
      expect(find.text('clinician@hospital.org'), findsOneWidget);
    });
  });

  group('ProfileScreen Logout Confirmation Dialog Tests', () {
    Widget createProfileTestWidget() {
      return ProviderScope(
        overrides: [
          currentUserProvider.overrideWithValue(MockAuthRepository.testUser),
          authStateProvider.overrideWith((ref) {
            return AuthNotifier(
              repository: mockRepo,
              onUnauthorized: unauthorizedController.stream,
            );
          }),
        ],
        child: const MaterialApp(
          home: ProfileScreen(),
        ),
      );
    }

    testWidgets('displays balanced modern logout dialog with Cancel and Log Out', (tester) async {
      await tester.pumpWidget(createProfileTestWidget());
      await tester.pump();

      // Tap Log Out of WoundInsight button
      await tester.tap(find.text('Log Out of WoundInsight'));
      await tester.pumpAndSettle();

      // Verify dialog layout and text
      expect(find.text('Log Out'), findsWidgets);
      expect(find.text('Are you sure you want to end your session?'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);

      // Both buttons are in a balanced row inside the dialog
      expect(find.widgetWithText(OutlinedButton, 'Cancel'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Log Out'), findsOneWidget);
    });

    testWidgets('tapping Cancel dismisses dialog without logging out', (tester) async {
      await tester.pumpWidget(createProfileTestWidget());
      await tester.pump();

      await tester.tap(find.text('Log Out of WoundInsight'));
      await tester.pumpAndSettle();

      // Tap Cancel
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(find.text('Are you sure you want to end your session?'), findsNothing);
      expect(mockRepo.logoutCalled, isFalse);
    });

    testWidgets('tapping Log Out confirms logout and calls notifier', (tester) async {
      await tester.pumpWidget(createProfileTestWidget());
      await tester.pump();

      await tester.tap(find.text('Log Out of WoundInsight'));
      await tester.pumpAndSettle();

      // Find the Log Out button inside the dialog and tap it
      final logOutButtons = find.widgetWithText(ElevatedButton, 'Log Out');
      expect(logOutButtons, findsOneWidget);
      await tester.tap(logOutButtons);
      await tester.pumpAndSettle();

      expect(mockRepo.logoutCalled, isTrue);
    });
  });
}
