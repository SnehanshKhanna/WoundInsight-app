import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/models/analysis_result.dart';
import 'package:wound_insight_app/models/analysis_list_response.dart';
import 'package:wound_insight_app/providers/core_providers.dart';
import 'package:wound_insight_app/repositories/analysis_repository.dart';
import 'package:wound_insight_app/providers/auth_providers.dart';
import 'package:wound_insight_app/models/user.dart';

enum ScanSubmissionStatus { idle, submitting, success, error }

class ScanSubmissionState {
  final ScanSubmissionStatus status;
  final AnalysisResult? result;
  final String? errorMessage;
  final String? lastImagePath;
  final String? lastWoundId;

  const ScanSubmissionState({
    required this.status,
    this.result,
    this.errorMessage,
    this.lastImagePath,
    this.lastWoundId,
  });

  const ScanSubmissionState.idle()
      : status = ScanSubmissionStatus.idle,
        result = null,
        errorMessage = null,
        lastImagePath = null,
        lastWoundId = null;

  const ScanSubmissionState.submitting({
    required String imagePath,
    required String woundId,
  })  : status = ScanSubmissionStatus.submitting,
        result = null,
        errorMessage = null,
        lastImagePath = imagePath,
        lastWoundId = woundId;

  const ScanSubmissionState.success(AnalysisResult res)
      : status = ScanSubmissionStatus.success,
        result = res,
        errorMessage = null,
        lastImagePath = null,
        lastWoundId = null;

  const ScanSubmissionState.error({
    required String message,
    required String imagePath,
    required String woundId,
  })  : status = ScanSubmissionStatus.error,
        result = null,
        errorMessage = message,
        lastImagePath = imagePath,
        lastWoundId = woundId;

  bool get isSubmitting => status == ScanSubmissionStatus.submitting;
}

class ScanSubmissionNotifier extends StateNotifier<ScanSubmissionState> {
  final AnalysisRepository _repository;
  final Ref? _ref;
  final User? _user;
  CancelToken? _activeCancelToken;

  ScanSubmissionNotifier(this._repository, this._ref, this._user) : super(const ScanSubmissionState.idle());

  Future<AnalysisResult?> submitScan({
    required String imagePath,
    required String woundId,
  }) async {
    if (_user == null) return null;
    if (state.isSubmitting) return null; // Prevent duplicate uploads

    _activeCancelToken = CancelToken();
    state = ScanSubmissionState.submitting(imagePath: imagePath, woundId: woundId);

    try {
      final res = await _repository.analyzeWoundImage(
        filePath: imagePath,
        woundId: woundId,
        cancelToken: _activeCancelToken,
      );
      state = ScanSubmissionState.success(res);
      if (_ref != null) {
        _ref.invalidate(recentScansProvider);
        _ref.invalidate(allUserScansProvider);
      }
      return res;
    } catch (e) {
      if (_activeCancelToken?.isCancelled ?? false) {
        state = const ScanSubmissionState.idle();
        return null;
      }
      state = ScanSubmissionState.error(
        message: e.toString(),
        imagePath: imagePath,
        woundId: woundId,
      );
      return null;
    } finally {
      _activeCancelToken = null;
    }
  }

  Future<AnalysisResult?> retryLastSubmission() async {
    final path = state.lastImagePath;
    final woundId = state.lastWoundId;
    if (path == null || woundId == null) return null;
    return submitScan(imagePath: path, woundId: woundId);
  }

  void cancel() {
    if (_activeCancelToken != null && !_activeCancelToken!.isCancelled) {
      _activeCancelToken!.cancel("User cancelled the scan submission.");
    }
    state = const ScanSubmissionState.idle();
  }

  void reset() {
    state = const ScanSubmissionState.idle();
  }
}

final scanSubmissionProvider =
    StateNotifierProvider<ScanSubmissionNotifier, ScanSubmissionState>((ref) {
  final user = ref.watch(currentUserProvider);
  final repo = ref.watch(analysisRepositoryProvider);
  return ScanSubmissionNotifier(repo, ref, user);
});

// User's recent scans (latest 5)
final recentScansProvider = FutureProvider<AnalysisListResponse>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return const AnalysisListResponse(analyses: [], total: 0, limit: 5, offset: 0);
  final repo = ref.watch(analysisRepositoryProvider);
  return await repo.getUserAnalyses(limit: 5, offset: 0);
});

// All user scans paginated
final allUserScansProvider =
    FutureProvider.family<AnalysisListResponse, int>((ref, offset) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return AnalysisListResponse(analyses: const [], total: 0, limit: 50, offset: offset);
  final repo = ref.watch(analysisRepositoryProvider);
  return await repo.getUserAnalyses(limit: 50, offset: offset);
});

// Single analysis detail provider
final analysisDetailProvider =
    FutureProvider.family<AnalysisResult, String>((ref, analysisId) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) throw Exception('Unauthenticated');
  final repo = ref.watch(analysisRepositoryProvider);
  return await repo.getAnalysisById(analysisId);
});

// Authenticated image bytes providers
final originalImageBytesProvider =
    FutureProvider.family<Uint8List, String>((ref, analysisId) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) throw Exception('Unauthenticated');
  final repo = ref.watch(analysisRepositoryProvider);
  return await repo.getOriginalImageBytes(analysisId);
});

final gradCamBytesProvider =
    FutureProvider.family<Uint8List, String>((ref, analysisId) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) throw Exception('Unauthenticated');
  final repo = ref.watch(analysisRepositoryProvider);
  return await repo.getGradCamBytes(analysisId);
});

final reportImageBytesProvider =
    FutureProvider.family<Uint8List, String>((ref, analysisId) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) throw Exception('Unauthenticated');
  final repo = ref.watch(analysisRepositoryProvider);
  return await repo.getReportImageBytes(analysisId);
});
