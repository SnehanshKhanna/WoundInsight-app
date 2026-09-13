// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tissue_composition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TissueComposition _$TissueCompositionFromJson(Map<String, dynamic> json) {
  return _TissueComposition.fromJson(json);
}

/// @nodoc
mixin _$TissueComposition {
  @JsonKey(name: 'fibrin_slough_percent')
  double get fibrinSloughPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'granulation_percent')
  double get granulationPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'callus_percent')
  double get callusPercent => throw _privateConstructorUsedError;

  /// Serializes this TissueComposition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TissueComposition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TissueCompositionCopyWith<TissueComposition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TissueCompositionCopyWith<$Res> {
  factory $TissueCompositionCopyWith(
    TissueComposition value,
    $Res Function(TissueComposition) then,
  ) = _$TissueCompositionCopyWithImpl<$Res, TissueComposition>;
  @useResult
  $Res call({
    @JsonKey(name: 'fibrin_slough_percent') double fibrinSloughPercent,
    @JsonKey(name: 'granulation_percent') double granulationPercent,
    @JsonKey(name: 'callus_percent') double callusPercent,
  });
}

/// @nodoc
class _$TissueCompositionCopyWithImpl<$Res, $Val extends TissueComposition>
    implements $TissueCompositionCopyWith<$Res> {
  _$TissueCompositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TissueComposition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fibrinSloughPercent = null,
    Object? granulationPercent = null,
    Object? callusPercent = null,
  }) {
    return _then(
      _value.copyWith(
            fibrinSloughPercent: null == fibrinSloughPercent
                ? _value.fibrinSloughPercent
                : fibrinSloughPercent // ignore: cast_nullable_to_non_nullable
                      as double,
            granulationPercent: null == granulationPercent
                ? _value.granulationPercent
                : granulationPercent // ignore: cast_nullable_to_non_nullable
                      as double,
            callusPercent: null == callusPercent
                ? _value.callusPercent
                : callusPercent // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TissueCompositionImplCopyWith<$Res>
    implements $TissueCompositionCopyWith<$Res> {
  factory _$$TissueCompositionImplCopyWith(
    _$TissueCompositionImpl value,
    $Res Function(_$TissueCompositionImpl) then,
  ) = __$$TissueCompositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'fibrin_slough_percent') double fibrinSloughPercent,
    @JsonKey(name: 'granulation_percent') double granulationPercent,
    @JsonKey(name: 'callus_percent') double callusPercent,
  });
}

/// @nodoc
class __$$TissueCompositionImplCopyWithImpl<$Res>
    extends _$TissueCompositionCopyWithImpl<$Res, _$TissueCompositionImpl>
    implements _$$TissueCompositionImplCopyWith<$Res> {
  __$$TissueCompositionImplCopyWithImpl(
    _$TissueCompositionImpl _value,
    $Res Function(_$TissueCompositionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TissueComposition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fibrinSloughPercent = null,
    Object? granulationPercent = null,
    Object? callusPercent = null,
  }) {
    return _then(
      _$TissueCompositionImpl(
        fibrinSloughPercent: null == fibrinSloughPercent
            ? _value.fibrinSloughPercent
            : fibrinSloughPercent // ignore: cast_nullable_to_non_nullable
                  as double,
        granulationPercent: null == granulationPercent
            ? _value.granulationPercent
            : granulationPercent // ignore: cast_nullable_to_non_nullable
                  as double,
        callusPercent: null == callusPercent
            ? _value.callusPercent
            : callusPercent // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TissueCompositionImpl implements _TissueComposition {
  const _$TissueCompositionImpl({
    @JsonKey(name: 'fibrin_slough_percent') required this.fibrinSloughPercent,
    @JsonKey(name: 'granulation_percent') required this.granulationPercent,
    @JsonKey(name: 'callus_percent') required this.callusPercent,
  });

  factory _$TissueCompositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TissueCompositionImplFromJson(json);

  @override
  @JsonKey(name: 'fibrin_slough_percent')
  final double fibrinSloughPercent;
  @override
  @JsonKey(name: 'granulation_percent')
  final double granulationPercent;
  @override
  @JsonKey(name: 'callus_percent')
  final double callusPercent;

  @override
  String toString() {
    return 'TissueComposition(fibrinSloughPercent: $fibrinSloughPercent, granulationPercent: $granulationPercent, callusPercent: $callusPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TissueCompositionImpl &&
            (identical(other.fibrinSloughPercent, fibrinSloughPercent) ||
                other.fibrinSloughPercent == fibrinSloughPercent) &&
            (identical(other.granulationPercent, granulationPercent) ||
                other.granulationPercent == granulationPercent) &&
            (identical(other.callusPercent, callusPercent) ||
                other.callusPercent == callusPercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    fibrinSloughPercent,
    granulationPercent,
    callusPercent,
  );

  /// Create a copy of TissueComposition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TissueCompositionImplCopyWith<_$TissueCompositionImpl> get copyWith =>
      __$$TissueCompositionImplCopyWithImpl<_$TissueCompositionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TissueCompositionImplToJson(this);
  }
}

abstract class _TissueComposition implements TissueComposition {
  const factory _TissueComposition({
    @JsonKey(name: 'fibrin_slough_percent')
    required final double fibrinSloughPercent,
    @JsonKey(name: 'granulation_percent')
    required final double granulationPercent,
    @JsonKey(name: 'callus_percent') required final double callusPercent,
  }) = _$TissueCompositionImpl;

  factory _TissueComposition.fromJson(Map<String, dynamic> json) =
      _$TissueCompositionImpl.fromJson;

  @override
  @JsonKey(name: 'fibrin_slough_percent')
  double get fibrinSloughPercent;
  @override
  @JsonKey(name: 'granulation_percent')
  double get granulationPercent;
  @override
  @JsonKey(name: 'callus_percent')
  double get callusPercent;

  /// Create a copy of TissueComposition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TissueCompositionImplCopyWith<_$TissueCompositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
