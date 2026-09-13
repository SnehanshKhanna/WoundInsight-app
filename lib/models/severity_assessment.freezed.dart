// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'severity_assessment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SeverityAssessment _$SeverityAssessmentFromJson(Map<String, dynamic> json) {
  return _SeverityAssessment.fromJson(json);
}

/// @nodoc
mixin _$SeverityAssessment {
  @JsonKey(name: 'severity_score')
  double get severityScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'severity_grade')
  String get severityGrade => throw _privateConstructorUsedError;
  @JsonKey(name: 'recommended_action')
  String get recommendedAction => throw _privateConstructorUsedError;

  /// Serializes this SeverityAssessment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeverityAssessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeverityAssessmentCopyWith<SeverityAssessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeverityAssessmentCopyWith<$Res> {
  factory $SeverityAssessmentCopyWith(
    SeverityAssessment value,
    $Res Function(SeverityAssessment) then,
  ) = _$SeverityAssessmentCopyWithImpl<$Res, SeverityAssessment>;
  @useResult
  $Res call({
    @JsonKey(name: 'severity_score') double severityScore,
    @JsonKey(name: 'severity_grade') String severityGrade,
    @JsonKey(name: 'recommended_action') String recommendedAction,
  });
}

/// @nodoc
class _$SeverityAssessmentCopyWithImpl<$Res, $Val extends SeverityAssessment>
    implements $SeverityAssessmentCopyWith<$Res> {
  _$SeverityAssessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeverityAssessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? severityScore = null,
    Object? severityGrade = null,
    Object? recommendedAction = null,
  }) {
    return _then(
      _value.copyWith(
            severityScore: null == severityScore
                ? _value.severityScore
                : severityScore // ignore: cast_nullable_to_non_nullable
                      as double,
            severityGrade: null == severityGrade
                ? _value.severityGrade
                : severityGrade // ignore: cast_nullable_to_non_nullable
                      as String,
            recommendedAction: null == recommendedAction
                ? _value.recommendedAction
                : recommendedAction // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SeverityAssessmentImplCopyWith<$Res>
    implements $SeverityAssessmentCopyWith<$Res> {
  factory _$$SeverityAssessmentImplCopyWith(
    _$SeverityAssessmentImpl value,
    $Res Function(_$SeverityAssessmentImpl) then,
  ) = __$$SeverityAssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'severity_score') double severityScore,
    @JsonKey(name: 'severity_grade') String severityGrade,
    @JsonKey(name: 'recommended_action') String recommendedAction,
  });
}

/// @nodoc
class __$$SeverityAssessmentImplCopyWithImpl<$Res>
    extends _$SeverityAssessmentCopyWithImpl<$Res, _$SeverityAssessmentImpl>
    implements _$$SeverityAssessmentImplCopyWith<$Res> {
  __$$SeverityAssessmentImplCopyWithImpl(
    _$SeverityAssessmentImpl _value,
    $Res Function(_$SeverityAssessmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SeverityAssessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? severityScore = null,
    Object? severityGrade = null,
    Object? recommendedAction = null,
  }) {
    return _then(
      _$SeverityAssessmentImpl(
        severityScore: null == severityScore
            ? _value.severityScore
            : severityScore // ignore: cast_nullable_to_non_nullable
                  as double,
        severityGrade: null == severityGrade
            ? _value.severityGrade
            : severityGrade // ignore: cast_nullable_to_non_nullable
                  as String,
        recommendedAction: null == recommendedAction
            ? _value.recommendedAction
            : recommendedAction // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SeverityAssessmentImpl implements _SeverityAssessment {
  const _$SeverityAssessmentImpl({
    @JsonKey(name: 'severity_score') required this.severityScore,
    @JsonKey(name: 'severity_grade') required this.severityGrade,
    @JsonKey(name: 'recommended_action') required this.recommendedAction,
  });

  factory _$SeverityAssessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeverityAssessmentImplFromJson(json);

  @override
  @JsonKey(name: 'severity_score')
  final double severityScore;
  @override
  @JsonKey(name: 'severity_grade')
  final String severityGrade;
  @override
  @JsonKey(name: 'recommended_action')
  final String recommendedAction;

  @override
  String toString() {
    return 'SeverityAssessment(severityScore: $severityScore, severityGrade: $severityGrade, recommendedAction: $recommendedAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeverityAssessmentImpl &&
            (identical(other.severityScore, severityScore) ||
                other.severityScore == severityScore) &&
            (identical(other.severityGrade, severityGrade) ||
                other.severityGrade == severityGrade) &&
            (identical(other.recommendedAction, recommendedAction) ||
                other.recommendedAction == recommendedAction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, severityScore, severityGrade, recommendedAction);

  /// Create a copy of SeverityAssessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeverityAssessmentImplCopyWith<_$SeverityAssessmentImpl> get copyWith =>
      __$$SeverityAssessmentImplCopyWithImpl<_$SeverityAssessmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SeverityAssessmentImplToJson(this);
  }
}

abstract class _SeverityAssessment implements SeverityAssessment {
  const factory _SeverityAssessment({
    @JsonKey(name: 'severity_score') required final double severityScore,
    @JsonKey(name: 'severity_grade') required final String severityGrade,
    @JsonKey(name: 'recommended_action')
    required final String recommendedAction,
  }) = _$SeverityAssessmentImpl;

  factory _SeverityAssessment.fromJson(Map<String, dynamic> json) =
      _$SeverityAssessmentImpl.fromJson;

  @override
  @JsonKey(name: 'severity_score')
  double get severityScore;
  @override
  @JsonKey(name: 'severity_grade')
  String get severityGrade;
  @override
  @JsonKey(name: 'recommended_action')
  String get recommendedAction;

  /// Create a copy of SeverityAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeverityAssessmentImplCopyWith<_$SeverityAssessmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
