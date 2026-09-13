// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'safety_qa.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SafetyQA _$SafetyQAFromJson(Map<String, dynamic> json) {
  return _SafetyQA.fromJson(json);
}

/// @nodoc
mixin _$SafetyQA {
  @JsonKey(name: 'ai_confidence_score')
  double get aiConfidenceScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'requires_clinician_review')
  bool get requiresClinicianReview => throw _privateConstructorUsedError;

  /// Serializes this SafetyQA to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SafetyQA
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SafetyQACopyWith<SafetyQA> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SafetyQACopyWith<$Res> {
  factory $SafetyQACopyWith(SafetyQA value, $Res Function(SafetyQA) then) =
      _$SafetyQACopyWithImpl<$Res, SafetyQA>;
  @useResult
  $Res call({
    @JsonKey(name: 'ai_confidence_score') double aiConfidenceScore,
    @JsonKey(name: 'requires_clinician_review') bool requiresClinicianReview,
  });
}

/// @nodoc
class _$SafetyQACopyWithImpl<$Res, $Val extends SafetyQA>
    implements $SafetyQACopyWith<$Res> {
  _$SafetyQACopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SafetyQA
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aiConfidenceScore = null,
    Object? requiresClinicianReview = null,
  }) {
    return _then(
      _value.copyWith(
            aiConfidenceScore: null == aiConfidenceScore
                ? _value.aiConfidenceScore
                : aiConfidenceScore // ignore: cast_nullable_to_non_nullable
                      as double,
            requiresClinicianReview: null == requiresClinicianReview
                ? _value.requiresClinicianReview
                : requiresClinicianReview // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SafetyQAImplCopyWith<$Res>
    implements $SafetyQACopyWith<$Res> {
  factory _$$SafetyQAImplCopyWith(
    _$SafetyQAImpl value,
    $Res Function(_$SafetyQAImpl) then,
  ) = __$$SafetyQAImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ai_confidence_score') double aiConfidenceScore,
    @JsonKey(name: 'requires_clinician_review') bool requiresClinicianReview,
  });
}

/// @nodoc
class __$$SafetyQAImplCopyWithImpl<$Res>
    extends _$SafetyQACopyWithImpl<$Res, _$SafetyQAImpl>
    implements _$$SafetyQAImplCopyWith<$Res> {
  __$$SafetyQAImplCopyWithImpl(
    _$SafetyQAImpl _value,
    $Res Function(_$SafetyQAImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SafetyQA
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aiConfidenceScore = null,
    Object? requiresClinicianReview = null,
  }) {
    return _then(
      _$SafetyQAImpl(
        aiConfidenceScore: null == aiConfidenceScore
            ? _value.aiConfidenceScore
            : aiConfidenceScore // ignore: cast_nullable_to_non_nullable
                  as double,
        requiresClinicianReview: null == requiresClinicianReview
            ? _value.requiresClinicianReview
            : requiresClinicianReview // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SafetyQAImpl implements _SafetyQA {
  const _$SafetyQAImpl({
    @JsonKey(name: 'ai_confidence_score') required this.aiConfidenceScore,
    @JsonKey(name: 'requires_clinician_review')
    required this.requiresClinicianReview,
  });

  factory _$SafetyQAImpl.fromJson(Map<String, dynamic> json) =>
      _$$SafetyQAImplFromJson(json);

  @override
  @JsonKey(name: 'ai_confidence_score')
  final double aiConfidenceScore;
  @override
  @JsonKey(name: 'requires_clinician_review')
  final bool requiresClinicianReview;

  @override
  String toString() {
    return 'SafetyQA(aiConfidenceScore: $aiConfidenceScore, requiresClinicianReview: $requiresClinicianReview)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SafetyQAImpl &&
            (identical(other.aiConfidenceScore, aiConfidenceScore) ||
                other.aiConfidenceScore == aiConfidenceScore) &&
            (identical(
                  other.requiresClinicianReview,
                  requiresClinicianReview,
                ) ||
                other.requiresClinicianReview == requiresClinicianReview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, aiConfidenceScore, requiresClinicianReview);

  /// Create a copy of SafetyQA
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SafetyQAImplCopyWith<_$SafetyQAImpl> get copyWith =>
      __$$SafetyQAImplCopyWithImpl<_$SafetyQAImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SafetyQAImplToJson(this);
  }
}

abstract class _SafetyQA implements SafetyQA {
  const factory _SafetyQA({
    @JsonKey(name: 'ai_confidence_score')
    required final double aiConfidenceScore,
    @JsonKey(name: 'requires_clinician_review')
    required final bool requiresClinicianReview,
  }) = _$SafetyQAImpl;

  factory _SafetyQA.fromJson(Map<String, dynamic> json) =
      _$SafetyQAImpl.fromJson;

  @override
  @JsonKey(name: 'ai_confidence_score')
  double get aiConfidenceScore;
  @override
  @JsonKey(name: 'requires_clinician_review')
  bool get requiresClinicianReview;

  /// Create a copy of SafetyQA
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SafetyQAImplCopyWith<_$SafetyQAImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
