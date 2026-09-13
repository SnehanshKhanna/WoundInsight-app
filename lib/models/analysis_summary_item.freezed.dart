// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_summary_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AnalysisSummaryItem _$AnalysisSummaryItemFromJson(Map<String, dynamic> json) {
  return _AnalysisSummaryItem.fromJson(json);
}

/// @nodoc
mixin _$AnalysisSummaryItem {
  @JsonKey(name: 'analysis_id')
  String get analysisId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_filename')
  String get originalFilename => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'wound_id')
  String? get woundId => throw _privateConstructorUsedError;
  @JsonKey(name: 'predicted_etiology')
  String get predictedEtiology => throw _privateConstructorUsedError;
  @JsonKey(name: 'etiology_confidence')
  double get etiologyConfidence => throw _privateConstructorUsedError;
  @JsonKey(name: 'wound_area_cm2')
  double get woundAreaCm2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'severity_grade')
  String get severityGrade => throw _privateConstructorUsedError;
  @JsonKey(name: 'severity_score')
  double get severityScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_confidence_score')
  double get aiConfidenceScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'clinician_review_flag')
  bool get clinicianReviewFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'report_image_url')
  String get reportImageUrl => throw _privateConstructorUsedError;

  /// Serializes this AnalysisSummaryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalysisSummaryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalysisSummaryItemCopyWith<AnalysisSummaryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisSummaryItemCopyWith<$Res> {
  factory $AnalysisSummaryItemCopyWith(
    AnalysisSummaryItem value,
    $Res Function(AnalysisSummaryItem) then,
  ) = _$AnalysisSummaryItemCopyWithImpl<$Res, AnalysisSummaryItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'analysis_id') String analysisId,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'original_filename') String originalFilename,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'wound_id') String? woundId,
    @JsonKey(name: 'predicted_etiology') String predictedEtiology,
    @JsonKey(name: 'etiology_confidence') double etiologyConfidence,
    @JsonKey(name: 'wound_area_cm2') double woundAreaCm2,
    @JsonKey(name: 'severity_grade') String severityGrade,
    @JsonKey(name: 'severity_score') double severityScore,
    @JsonKey(name: 'ai_confidence_score') double aiConfidenceScore,
    @JsonKey(name: 'clinician_review_flag') bool clinicianReviewFlag,
    @JsonKey(name: 'report_image_url') String reportImageUrl,
  });
}

/// @nodoc
class _$AnalysisSummaryItemCopyWithImpl<$Res, $Val extends AnalysisSummaryItem>
    implements $AnalysisSummaryItemCopyWith<$Res> {
  _$AnalysisSummaryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalysisSummaryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analysisId = null,
    Object? createdAt = null,
    Object? originalFilename = null,
    Object? userId = freezed,
    Object? woundId = freezed,
    Object? predictedEtiology = null,
    Object? etiologyConfidence = null,
    Object? woundAreaCm2 = null,
    Object? severityGrade = null,
    Object? severityScore = null,
    Object? aiConfidenceScore = null,
    Object? clinicianReviewFlag = null,
    Object? reportImageUrl = null,
  }) {
    return _then(
      _value.copyWith(
            analysisId: null == analysisId
                ? _value.analysisId
                : analysisId // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            originalFilename: null == originalFilename
                ? _value.originalFilename
                : originalFilename // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            woundId: freezed == woundId
                ? _value.woundId
                : woundId // ignore: cast_nullable_to_non_nullable
                      as String?,
            predictedEtiology: null == predictedEtiology
                ? _value.predictedEtiology
                : predictedEtiology // ignore: cast_nullable_to_non_nullable
                      as String,
            etiologyConfidence: null == etiologyConfidence
                ? _value.etiologyConfidence
                : etiologyConfidence // ignore: cast_nullable_to_non_nullable
                      as double,
            woundAreaCm2: null == woundAreaCm2
                ? _value.woundAreaCm2
                : woundAreaCm2 // ignore: cast_nullable_to_non_nullable
                      as double,
            severityGrade: null == severityGrade
                ? _value.severityGrade
                : severityGrade // ignore: cast_nullable_to_non_nullable
                      as String,
            severityScore: null == severityScore
                ? _value.severityScore
                : severityScore // ignore: cast_nullable_to_non_nullable
                      as double,
            aiConfidenceScore: null == aiConfidenceScore
                ? _value.aiConfidenceScore
                : aiConfidenceScore // ignore: cast_nullable_to_non_nullable
                      as double,
            clinicianReviewFlag: null == clinicianReviewFlag
                ? _value.clinicianReviewFlag
                : clinicianReviewFlag // ignore: cast_nullable_to_non_nullable
                      as bool,
            reportImageUrl: null == reportImageUrl
                ? _value.reportImageUrl
                : reportImageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnalysisSummaryItemImplCopyWith<$Res>
    implements $AnalysisSummaryItemCopyWith<$Res> {
  factory _$$AnalysisSummaryItemImplCopyWith(
    _$AnalysisSummaryItemImpl value,
    $Res Function(_$AnalysisSummaryItemImpl) then,
  ) = __$$AnalysisSummaryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'analysis_id') String analysisId,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'original_filename') String originalFilename,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'wound_id') String? woundId,
    @JsonKey(name: 'predicted_etiology') String predictedEtiology,
    @JsonKey(name: 'etiology_confidence') double etiologyConfidence,
    @JsonKey(name: 'wound_area_cm2') double woundAreaCm2,
    @JsonKey(name: 'severity_grade') String severityGrade,
    @JsonKey(name: 'severity_score') double severityScore,
    @JsonKey(name: 'ai_confidence_score') double aiConfidenceScore,
    @JsonKey(name: 'clinician_review_flag') bool clinicianReviewFlag,
    @JsonKey(name: 'report_image_url') String reportImageUrl,
  });
}

/// @nodoc
class __$$AnalysisSummaryItemImplCopyWithImpl<$Res>
    extends _$AnalysisSummaryItemCopyWithImpl<$Res, _$AnalysisSummaryItemImpl>
    implements _$$AnalysisSummaryItemImplCopyWith<$Res> {
  __$$AnalysisSummaryItemImplCopyWithImpl(
    _$AnalysisSummaryItemImpl _value,
    $Res Function(_$AnalysisSummaryItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalysisSummaryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analysisId = null,
    Object? createdAt = null,
    Object? originalFilename = null,
    Object? userId = freezed,
    Object? woundId = freezed,
    Object? predictedEtiology = null,
    Object? etiologyConfidence = null,
    Object? woundAreaCm2 = null,
    Object? severityGrade = null,
    Object? severityScore = null,
    Object? aiConfidenceScore = null,
    Object? clinicianReviewFlag = null,
    Object? reportImageUrl = null,
  }) {
    return _then(
      _$AnalysisSummaryItemImpl(
        analysisId: null == analysisId
            ? _value.analysisId
            : analysisId // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        originalFilename: null == originalFilename
            ? _value.originalFilename
            : originalFilename // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        woundId: freezed == woundId
            ? _value.woundId
            : woundId // ignore: cast_nullable_to_non_nullable
                  as String?,
        predictedEtiology: null == predictedEtiology
            ? _value.predictedEtiology
            : predictedEtiology // ignore: cast_nullable_to_non_nullable
                  as String,
        etiologyConfidence: null == etiologyConfidence
            ? _value.etiologyConfidence
            : etiologyConfidence // ignore: cast_nullable_to_non_nullable
                  as double,
        woundAreaCm2: null == woundAreaCm2
            ? _value.woundAreaCm2
            : woundAreaCm2 // ignore: cast_nullable_to_non_nullable
                  as double,
        severityGrade: null == severityGrade
            ? _value.severityGrade
            : severityGrade // ignore: cast_nullable_to_non_nullable
                  as String,
        severityScore: null == severityScore
            ? _value.severityScore
            : severityScore // ignore: cast_nullable_to_non_nullable
                  as double,
        aiConfidenceScore: null == aiConfidenceScore
            ? _value.aiConfidenceScore
            : aiConfidenceScore // ignore: cast_nullable_to_non_nullable
                  as double,
        clinicianReviewFlag: null == clinicianReviewFlag
            ? _value.clinicianReviewFlag
            : clinicianReviewFlag // ignore: cast_nullable_to_non_nullable
                  as bool,
        reportImageUrl: null == reportImageUrl
            ? _value.reportImageUrl
            : reportImageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalysisSummaryItemImpl implements _AnalysisSummaryItem {
  const _$AnalysisSummaryItemImpl({
    @JsonKey(name: 'analysis_id') required this.analysisId,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'original_filename') required this.originalFilename,
    @JsonKey(name: 'user_id') this.userId,
    @JsonKey(name: 'wound_id') this.woundId,
    @JsonKey(name: 'predicted_etiology') required this.predictedEtiology,
    @JsonKey(name: 'etiology_confidence') required this.etiologyConfidence,
    @JsonKey(name: 'wound_area_cm2') required this.woundAreaCm2,
    @JsonKey(name: 'severity_grade') required this.severityGrade,
    @JsonKey(name: 'severity_score') required this.severityScore,
    @JsonKey(name: 'ai_confidence_score') required this.aiConfidenceScore,
    @JsonKey(name: 'clinician_review_flag') required this.clinicianReviewFlag,
    @JsonKey(name: 'report_image_url') required this.reportImageUrl,
  });

  factory _$AnalysisSummaryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalysisSummaryItemImplFromJson(json);

  @override
  @JsonKey(name: 'analysis_id')
  final String analysisId;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'original_filename')
  final String originalFilename;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'wound_id')
  final String? woundId;
  @override
  @JsonKey(name: 'predicted_etiology')
  final String predictedEtiology;
  @override
  @JsonKey(name: 'etiology_confidence')
  final double etiologyConfidence;
  @override
  @JsonKey(name: 'wound_area_cm2')
  final double woundAreaCm2;
  @override
  @JsonKey(name: 'severity_grade')
  final String severityGrade;
  @override
  @JsonKey(name: 'severity_score')
  final double severityScore;
  @override
  @JsonKey(name: 'ai_confidence_score')
  final double aiConfidenceScore;
  @override
  @JsonKey(name: 'clinician_review_flag')
  final bool clinicianReviewFlag;
  @override
  @JsonKey(name: 'report_image_url')
  final String reportImageUrl;

  @override
  String toString() {
    return 'AnalysisSummaryItem(analysisId: $analysisId, createdAt: $createdAt, originalFilename: $originalFilename, userId: $userId, woundId: $woundId, predictedEtiology: $predictedEtiology, etiologyConfidence: $etiologyConfidence, woundAreaCm2: $woundAreaCm2, severityGrade: $severityGrade, severityScore: $severityScore, aiConfidenceScore: $aiConfidenceScore, clinicianReviewFlag: $clinicianReviewFlag, reportImageUrl: $reportImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisSummaryItemImpl &&
            (identical(other.analysisId, analysisId) ||
                other.analysisId == analysisId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.originalFilename, originalFilename) ||
                other.originalFilename == originalFilename) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.woundId, woundId) || other.woundId == woundId) &&
            (identical(other.predictedEtiology, predictedEtiology) ||
                other.predictedEtiology == predictedEtiology) &&
            (identical(other.etiologyConfidence, etiologyConfidence) ||
                other.etiologyConfidence == etiologyConfidence) &&
            (identical(other.woundAreaCm2, woundAreaCm2) ||
                other.woundAreaCm2 == woundAreaCm2) &&
            (identical(other.severityGrade, severityGrade) ||
                other.severityGrade == severityGrade) &&
            (identical(other.severityScore, severityScore) ||
                other.severityScore == severityScore) &&
            (identical(other.aiConfidenceScore, aiConfidenceScore) ||
                other.aiConfidenceScore == aiConfidenceScore) &&
            (identical(other.clinicianReviewFlag, clinicianReviewFlag) ||
                other.clinicianReviewFlag == clinicianReviewFlag) &&
            (identical(other.reportImageUrl, reportImageUrl) ||
                other.reportImageUrl == reportImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    analysisId,
    createdAt,
    originalFilename,
    userId,
    woundId,
    predictedEtiology,
    etiologyConfidence,
    woundAreaCm2,
    severityGrade,
    severityScore,
    aiConfidenceScore,
    clinicianReviewFlag,
    reportImageUrl,
  );

  /// Create a copy of AnalysisSummaryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisSummaryItemImplCopyWith<_$AnalysisSummaryItemImpl> get copyWith =>
      __$$AnalysisSummaryItemImplCopyWithImpl<_$AnalysisSummaryItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalysisSummaryItemImplToJson(this);
  }
}

abstract class _AnalysisSummaryItem implements AnalysisSummaryItem {
  const factory _AnalysisSummaryItem({
    @JsonKey(name: 'analysis_id') required final String analysisId,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'original_filename') required final String originalFilename,
    @JsonKey(name: 'user_id') final String? userId,
    @JsonKey(name: 'wound_id') final String? woundId,
    @JsonKey(name: 'predicted_etiology')
    required final String predictedEtiology,
    @JsonKey(name: 'etiology_confidence')
    required final double etiologyConfidence,
    @JsonKey(name: 'wound_area_cm2') required final double woundAreaCm2,
    @JsonKey(name: 'severity_grade') required final String severityGrade,
    @JsonKey(name: 'severity_score') required final double severityScore,
    @JsonKey(name: 'ai_confidence_score')
    required final double aiConfidenceScore,
    @JsonKey(name: 'clinician_review_flag')
    required final bool clinicianReviewFlag,
    @JsonKey(name: 'report_image_url') required final String reportImageUrl,
  }) = _$AnalysisSummaryItemImpl;

  factory _AnalysisSummaryItem.fromJson(Map<String, dynamic> json) =
      _$AnalysisSummaryItemImpl.fromJson;

  @override
  @JsonKey(name: 'analysis_id')
  String get analysisId;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'original_filename')
  String get originalFilename;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'wound_id')
  String? get woundId;
  @override
  @JsonKey(name: 'predicted_etiology')
  String get predictedEtiology;
  @override
  @JsonKey(name: 'etiology_confidence')
  double get etiologyConfidence;
  @override
  @JsonKey(name: 'wound_area_cm2')
  double get woundAreaCm2;
  @override
  @JsonKey(name: 'severity_grade')
  String get severityGrade;
  @override
  @JsonKey(name: 'severity_score')
  double get severityScore;
  @override
  @JsonKey(name: 'ai_confidence_score')
  double get aiConfidenceScore;
  @override
  @JsonKey(name: 'clinician_review_flag')
  bool get clinicianReviewFlag;
  @override
  @JsonKey(name: 'report_image_url')
  String get reportImageUrl;

  /// Create a copy of AnalysisSummaryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalysisSummaryItemImplCopyWith<_$AnalysisSummaryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
