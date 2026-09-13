import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/core/network/api_exceptions.dart';
import 'package:wound_insight_app/models/user.dart';
import 'package:wound_insight_app/providers/core_providers.dart';
import 'package:wound_insight_app/repositories/auth_repository.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState {
  final AuthStatus status;
  final User? user;
  final String? errorMessage;

  const AuthState({
    required this.status,
    this.user,
    this.errorMessage,
  });

  const AuthState.initial()
      : status = AuthStatus.initial,
        user = null,
        errorMessage = null;

  const AuthState.loading()
      : status = AuthStatus.loading,
        user = null,
        errorMessage = null;

  const AuthState.authenticated(this.user)
      : status = AuthStatus.authenticated,
        errorMessage = null;

  const AuthState.unauthenticated()
      : status = AuthStatus.unauthenticated,
        user = null,
        errorMessage = null;

  const AuthState.error(String message)
      : status = AuthStatus.error,
        user = null,
        errorMessage = message;

  bool get isAuthenticated => status == AuthStatus.authenticated && user != null;
  bool get isLoading => status == AuthStatus.loading;
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;

  AuthNotifier({
    required AuthRepository repository,
    required Stream<void> onUnauthorized,
  })  : _repository = repository,
        super(const AuthState.initial()) {
    // Auto-logout when API receives a 401 Unauthorized
    onUnauthorized.listen((_) {
      logout();
    });
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    // Keep initial status so splash screen stays visible during boot check
    try {
      final user = await _repository.tryAutoLogin();
      if (user != null) {
        state = AuthState.authenticated(user);
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      state = const AuthState.unauthenticated();
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();
    try {
      final user = await _repository.login(email: email, password: password);
      state = AuthState.authenticated(user);
      return true;
    } catch (e) {
      final String message;
      if (e is UnauthorizedException) {
        message = 'Incorrect email or password. Please try again.';
      } else if (e is NetworkException || e is TimeoutException) {
        message = 'Unable to connect to the server. Please check your connection and try again.';
      } else if (e is ServerException) {
        message = 'An unexpected server error occurred. Please try again.';
      } else if (e is AppException) {
        message = e.message;
      } else {
        message = 'Unable to connect to the server. Please check your connection and try again.';
      }
      state = AuthState.error(message);
      return false;
    }
  }

  Future<bool> register({
    required String email,
    required String password,
    String? name,
  }) async {
    state = const AuthState.loading();
    try {
      final user = await _repository.register(
        email: email,
        password: password,
        name: name,
      );
      state = AuthState.authenticated(user);
      return true;
    } catch (e) {
      final String message;
      if (e is ValidationException) {
        message = e.message;
      } else if (e is NetworkException || e is TimeoutException) {
        message = 'Unable to connect to the server. Please check your connection and try again.';
      } else if (e is ServerException) {
        message = 'An unexpected server error occurred. Please try again.';
      } else if (e is AppException) {
        message = e.message;
      } else {
        message = 'Registration failed. Please try again.';
      }
      state = AuthState.error(message);
      return false;
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    state = const AuthState.unauthenticated();
  }
}

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  final client = ref.watch(apiClientProvider);
  return AuthNotifier(
    repository: repo,
    onUnauthorized: client.onUnauthorized,
  );
});

final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authStateProvider).user;
});
