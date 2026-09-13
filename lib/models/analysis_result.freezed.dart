// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AnalysisResult _$AnalysisResultFromJson(Map<String, dynamic> json) {
  return _AnalysisResult.fromJson(json);
}

/// @nodoc
mixin _$AnalysisResult {
  @JsonKey(name: 'analysis_id')
  String get analysisId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_filename')
  String get originalFilename => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'wound_id')
  String? get woundId => throw _privateConstructorUsedError;
  WoundMorphometrics get wound => throw _privateConstructorUsedError;
  TissueComposition get tissue => throw _privateConstructorUsedError;
  EtiologyDiagnostics get etiology => throw _privateConstructorUsedError;
  SeverityAssessment get severity => throw _privateConstructorUsedError;
  SafetyQA get uncertainty => throw _privateConstructorUsedError;
  VisualOutputs get visualizations => throw _privateConstructorUsedError;
  ExplainabilityAttribution? get explainability =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'academic_notice')
  String? get academicNotice => throw _privateConstructorUsedError;

  /// Serializes this AnalysisResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalysisResultCopyWith<AnalysisResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisResultCopyWith<$Res> {
  factory $AnalysisResultCopyWith(
    AnalysisResult value,
    $Res Function(AnalysisResult) then,
  ) = _$AnalysisResultCopyWithImpl<$Res, AnalysisResult>;
  @useResult
  $Res call({
    @JsonKey(name: 'analysis_id') String analysisId,
    String status,
    String timestamp,
    @JsonKey(name: 'original_filename') String originalFilename,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'wound_id') String? woundId,
    WoundMorphometrics wound,
    TissueComposition tissue,
    EtiologyDiagnostics etiology,
    SeverityAssessment severity,
    SafetyQA uncertainty,
    VisualOutputs visualizations,
    ExplainabilityAttribution? explainability,
    @JsonKey(name: 'academic_notice') String? academicNotice,
  });

  $WoundMorphometricsCopyWith<$Res> get wound;
  $TissueCompositionCopyWith<$Res> get tissue;
  $EtiologyDiagnosticsCopyWith<$Res> get etiology;
  $SeverityAssessmentCopyWith<$Res> get severity;
  $SafetyQACopyWith<$Res> get uncertainty;
  $VisualOutputsCopyWith<$Res> get visualizations;
  $ExplainabilityAttributionCopyWith<$Res>? get explainability;
}

/// @nodoc
class _$AnalysisResultCopyWithImpl<$Res, $Val extends AnalysisResult>
    implements $AnalysisResultCopyWith<$Res> {
  _$AnalysisResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analysisId = null,
    Object? status = null,
    Object? timestamp = null,
    Object? originalFilename = null,
    Object? userId = freezed,
    Object? woundId = freezed,
    Object? wound = null,
    Object? tissue = null,
    Object? etiology = null,
    Object? severity = null,
    Object? uncertainty = null,
    Object? visualizations = null,
    Object? explainability = freezed,
    Object? academicNotice = freezed,
  }) {
    return _then(
      _value.copyWith(
            analysisId: null == analysisId
                ? _value.analysisId
                : analysisId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
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
            wound: null == wound
                ? _value.wound
                : wound // ignore: cast_nullable_to_non_nullable
                      as WoundMorphometrics,
            tissue: null == tissue
                ? _value.tissue
                : tissue // ignore: cast_nullable_to_non_nullable
                      as TissueComposition,
            etiology: null == etiology
                ? _value.etiology
                : etiology // ignore: cast_nullable_to_non_nullable
                      as EtiologyDiagnostics,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as SeverityAssessment,
            uncertainty: null == uncertainty
                ? _value.uncertainty
                : uncertainty // ignore: cast_nullable_to_non_nullable
                      as SafetyQA,
            visualizations: null == visualizations
                ? _value.visualizations
                : visualizations // ignore: cast_nullable_to_non_nullable
                      as VisualOutputs,
            explainability: freezed == explainability
                ? _value.explainability
                : explainability // ignore: cast_nullable_to_non_nullable
                      as ExplainabilityAttribution?,
            academicNotice: freezed == academicNotice
                ? _value.academicNotice
                : academicNotice // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WoundMorphometricsCopyWith<$Res> get wound {
    return $WoundMorphometricsCopyWith<$Res>(_value.wound, (value) {
      return _then(_value.copyWith(wound: value) as $Val);
    });
  }

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TissueCompositionCopyWith<$Res> get tissue {
    return $TissueCompositionCopyWith<$Res>(_value.tissue, (value) {
      return _then(_value.copyWith(tissue: value) as $Val);
    });
  }

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EtiologyDiagnosticsCopyWith<$Res> get etiology {
    return $EtiologyDiagnosticsCopyWith<$Res>(_value.etiology, (value) {
      return _then(_value.copyWith(etiology: value) as $Val);
    });
  }

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeverityAssessmentCopyWith<$Res> get severity {
    return $SeverityAssessmentCopyWith<$Res>(_value.severity, (value) {
      return _then(_value.copyWith(severity: value) as $Val);
    });
  }

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SafetyQACopyWith<$Res> get uncertainty {
    return $SafetyQACopyWith<$Res>(_value.uncertainty, (value) {
      return _then(_value.copyWith(uncertainty: value) as $Val);
    });
  }

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VisualOutputsCopyWith<$Res> get visualizations {
    return $VisualOutputsCopyWith<$Res>(_value.visualizations, (value) {
      return _then(_value.copyWith(visualizations: value) as $Val);
    });
  }

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExplainabilityAttributionCopyWith<$Res>? get explainability {
    if (_value.explainability == null) {
      return null;
    }

    return $ExplainabilityAttributionCopyWith<$Res>(_value.explainability!, (
      value,
    ) {
      return _then(_value.copyWith(explainability: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalysisResultImplCopyWith<$Res>
    implements $AnalysisResultCopyWith<$Res> {
  factory _$$AnalysisResultImplCopyWith(
    _$AnalysisResultImpl value,
    $Res Function(_$AnalysisResultImpl) then,
  ) = __$$AnalysisResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'analysis_id') String analysisId,
    String status,
    String timestamp,
    @JsonKey(name: 'original_filename') String originalFilename,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'wound_id') String? woundId,
    WoundMorphometrics wound,
    TissueComposition tissue,
    EtiologyDiagnostics etiology,
    SeverityAssessment severity,
    SafetyQA uncertainty,
    VisualOutputs visualizations,
    ExplainabilityAttribution? explainability,
    @JsonKey(name: 'academic_notice') String? academicNotice,
  });

  @override
  $WoundMorphometricsCopyWith<$Res> get wound;
  @override
  $TissueCompositionCopyWith<$Res> get tissue;
  @override
  $EtiologyDiagnosticsCopyWith<$Res> get etiology;
  @override
  $SeverityAssessmentCopyWith<$Res> get severity;
  @override
  $SafetyQACopyWith<$Res> get uncertainty;
  @override
  $VisualOutputsCopyWith<$Res> get visualizations;
  @override
  $ExplainabilityAttributionCopyWith<$Res>? get explainability;
}

/// @nodoc
class __$$AnalysisResultImplCopyWithImpl<$Res>
    extends _$AnalysisResultCopyWithImpl<$Res, _$AnalysisResultImpl>
    implements _$$AnalysisResultImplCopyWith<$Res> {
  __$$AnalysisResultImplCopyWithImpl(
    _$AnalysisResultImpl _value,
    $Res Function(_$AnalysisResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analysisId = null,
    Object? status = null,
    Object? timestamp = null,
    Object? originalFilename = null,
    Object? userId = freezed,
    Object? woundId = freezed,
    Object? wound = null,
    Object? tissue = null,
    Object? etiology = null,
    Object? severity = null,
    Object? uncertainty = null,
    Object? visualizations = null,
    Object? explainability = freezed,
    Object? academicNotice = freezed,
  }) {
    return _then(
      _$AnalysisResultImpl(
        analysisId: null == analysisId
            ? _value.analysisId
            : analysisId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
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
        wound: null == wound
            ? _value.wound
            : wound // ignore: cast_nullable_to_non_nullable
                  as WoundMorphometrics,
        tissue: null == tissue
            ? _value.tissue
            : tissue // ignore: cast_nullable_to_non_nullable
                  as TissueComposition,
        etiology: null == etiology
            ? _value.etiology
            : etiology // ignore: cast_nullable_to_non_nullable
                  as EtiologyDiagnostics,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as SeverityAssessment,
        uncertainty: null == uncertainty
            ? _value.uncertainty
            : uncertainty // ignore: cast_nullable_to_non_nullable
                  as SafetyQA,
        visualizations: null == visualizations
            ? _value.visualizations
            : visualizations // ignore: cast_nullable_to_non_nullable
                  as VisualOutputs,
        explainability: freezed == explainability
            ? _value.explainability
            : explainability // ignore: cast_nullable_to_non_nullable
                  as ExplainabilityAttribution?,
        academicNotice: freezed == academicNotice
            ? _value.academicNotice
            : academicNotice // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalysisResultImpl implements _AnalysisResult {
  const _$AnalysisResultImpl({
    @JsonKey(name: 'analysis_id') required this.analysisId,
    this.status = 'success',
    required this.timestamp,
    @JsonKey(name: 'original_filename') required this.originalFilename,
    @JsonKey(name: 'user_id') this.userId,
    @JsonKey(name: 'wound_id') this.woundId,
    required this.wound,
    required this.tissue,
    required this.etiology,
    required this.severity,
    required this.uncertainty,
    required this.visualizations,
    this.explainability,
    @JsonKey(name: 'academic_notice') this.academicNotice,
  });

  factory _$AnalysisResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalysisResultImplFromJson(json);

  @override
  @JsonKey(name: 'analysis_id')
  final String analysisId;
  @override
  @JsonKey()
  final String status;
  @override
  final String timestamp;
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
  final WoundMorphometrics wound;
  @override
  final TissueComposition tissue;
  @override
  final EtiologyDiagnostics etiology;
  @override
  final SeverityAssessment severity;
  @override
  final SafetyQA uncertainty;
  @override
  final VisualOutputs visualizations;
  @override
  final ExplainabilityAttribution? explainability;
  @override
  @JsonKey(name: 'academic_notice')
  final String? academicNotice;

  @override
  String toString() {
    return 'AnalysisResult(analysisId: $analysisId, status: $status, timestamp: $timestamp, originalFilename: $originalFilename, userId: $userId, woundId: $woundId, wound: $wound, tissue: $tissue, etiology: $etiology, severity: $severity, uncertainty: $uncertainty, visualizations: $visualizations, explainability: $explainability, academicNotice: $academicNotice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisResultImpl &&
            (identical(other.analysisId, analysisId) ||
                other.analysisId == analysisId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.originalFilename, originalFilename) ||
                other.originalFilename == originalFilename) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.woundId, woundId) || other.woundId == woundId) &&
            (identical(other.wound, wound) || other.wound == wound) &&
            (identical(other.tissue, tissue) || other.tissue == tissue) &&
            (identical(other.etiology, etiology) ||
                other.etiology == etiology) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.uncertainty, uncertainty) ||
                other.uncertainty == uncertainty) &&
            (identical(other.visualizations, visualizations) ||
                other.visualizations == visualizations) &&
            (identical(other.explainability, explainability) ||
                other.explainability == explainability) &&
            (identical(other.academicNotice, academicNotice) ||
                other.academicNotice == academicNotice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    analysisId,
    status,
    timestamp,
    originalFilename,
    userId,
    woundId,
    wound,
    tissue,
    etiology,
    severity,
    uncertainty,
    visualizations,
    explainability,
    academicNotice,
  );

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisResultImplCopyWith<_$AnalysisResultImpl> get copyWith =>
      __$$AnalysisResultImplCopyWithImpl<_$AnalysisResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalysisResultImplToJson(this);
  }
}

abstract class _AnalysisResult implements AnalysisResult {
  const factory _AnalysisResult({
    @JsonKey(name: 'analysis_id') required final String analysisId,
    final String status,
    required final String timestamp,
    @JsonKey(name: 'original_filename') required final String originalFilename,
    @JsonKey(name: 'user_id') final String? userId,
    @JsonKey(name: 'wound_id') final String? woundId,
    required final WoundMorphometrics wound,
    required final TissueComposition tissue,
    required final EtiologyDiagnostics etiology,
    required final SeverityAssessment severity,
    required final SafetyQA uncertainty,
    required final VisualOutputs visualizations,
    final ExplainabilityAttribution? explainability,
    @JsonKey(name: 'academic_notice') final String? academicNotice,
  }) = _$AnalysisResultImpl;

  factory _AnalysisResult.fromJson(Map<String, dynamic> json) =
      _$AnalysisResultImpl.fromJson;

  @override
  @JsonKey(name: 'analysis_id')
  String get analysisId;
  @override
  String get status;
  @override
  String get timestamp;
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
  WoundMorphometrics get wound;
  @override
  TissueComposition get tissue;
  @override
  EtiologyDiagnostics get etiology;
  @override
  SeverityAssessment get severity;
  @override
  SafetyQA get uncertainty;
  @override
  VisualOutputs get visualizations;
  @override
  ExplainabilityAttribution? get explainability;
  @override
  @JsonKey(name: 'academic_notice')
  String? get academicNotice;

  /// Create a copy of AnalysisResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalysisResultImplCopyWith<_$AnalysisResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
