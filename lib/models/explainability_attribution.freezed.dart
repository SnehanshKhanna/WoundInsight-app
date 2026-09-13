// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explainability_attribution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ExplainabilityAttribution _$ExplainabilityAttributionFromJson(
  Map<String, dynamic> json,
) {
  return _ExplainabilityAttribution.fromJson(json);
}

/// @nodoc
mixin _$ExplainabilityAttribution {
  bool get available => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_class')
  String? get targetClass => throw _privateConstructorUsedError;
  @JsonKey(name: 'global_target_layer')
  String? get globalTargetLayer => throw _privateConstructorUsedError;
  @JsonKey(name: 'roi_target_layer')
  String? get roiTargetLayer => throw _privateConstructorUsedError;
  @JsonKey(name: 'fusion_method')
  String? get fusionMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'academic_notice')
  String? get academicNotice => throw _privateConstructorUsedError;

  /// Serializes this ExplainabilityAttribution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExplainabilityAttribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExplainabilityAttributionCopyWith<ExplainabilityAttribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExplainabilityAttributionCopyWith<$Res> {
  factory $ExplainabilityAttributionCopyWith(
    ExplainabilityAttribution value,
    $Res Function(ExplainabilityAttribution) then,
  ) = _$ExplainabilityAttributionCopyWithImpl<$Res, ExplainabilityAttribution>;
  @useResult
  $Res call({
    bool available,
    String method,
    @JsonKey(name: 'target_class') String? targetClass,
    @JsonKey(name: 'global_target_layer') String? globalTargetLayer,
    @JsonKey(name: 'roi_target_layer') String? roiTargetLayer,
    @JsonKey(name: 'fusion_method') String? fusionMethod,
    @JsonKey(name: 'academic_notice') String? academicNotice,
  });
}

/// @nodoc
class _$ExplainabilityAttributionCopyWithImpl<
  $Res,
  $Val extends ExplainabilityAttribution
>
    implements $ExplainabilityAttributionCopyWith<$Res> {
  _$ExplainabilityAttributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExplainabilityAttribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
    Object? method = null,
    Object? targetClass = freezed,
    Object? globalTargetLayer = freezed,
    Object? roiTargetLayer = freezed,
    Object? fusionMethod = freezed,
    Object? academicNotice = freezed,
  }) {
    return _then(
      _value.copyWith(
            available: null == available
                ? _value.available
                : available // ignore: cast_nullable_to_non_nullable
                      as bool,
            method: null == method
                ? _value.method
                : method // ignore: cast_nullable_to_non_nullable
                      as String,
            targetClass: freezed == targetClass
                ? _value.targetClass
                : targetClass // ignore: cast_nullable_to_non_nullable
                      as String?,
            globalTargetLayer: freezed == globalTargetLayer
                ? _value.globalTargetLayer
                : globalTargetLayer // ignore: cast_nullable_to_non_nullable
                      as String?,
            roiTargetLayer: freezed == roiTargetLayer
                ? _value.roiTargetLayer
                : roiTargetLayer // ignore: cast_nullable_to_non_nullable
                      as String?,
            fusionMethod: freezed == fusionMethod
                ? _value.fusionMethod
                : fusionMethod // ignore: cast_nullable_to_non_nullable
                      as String?,
            academicNotice: freezed == academicNotice
                ? _value.academicNotice
                : academicNotice // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExplainabilityAttributionImplCopyWith<$Res>
    implements $ExplainabilityAttributionCopyWith<$Res> {
  factory _$$ExplainabilityAttributionImplCopyWith(
    _$ExplainabilityAttributionImpl value,
    $Res Function(_$ExplainabilityAttributionImpl) then,
  ) = __$$ExplainabilityAttributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool available,
    String method,
    @JsonKey(name: 'target_class') String? targetClass,
    @JsonKey(name: 'global_target_layer') String? globalTargetLayer,
    @JsonKey(name: 'roi_target_layer') String? roiTargetLayer,
    @JsonKey(name: 'fusion_method') String? fusionMethod,
    @JsonKey(name: 'academic_notice') String? academicNotice,
  });
}

/// @nodoc
class __$$ExplainabilityAttributionImplCopyWithImpl<$Res>
    extends
        _$ExplainabilityAttributionCopyWithImpl<
          $Res,
          _$ExplainabilityAttributionImpl
        >
    implements _$$ExplainabilityAttributionImplCopyWith<$Res> {
  __$$ExplainabilityAttributionImplCopyWithImpl(
    _$ExplainabilityAttributionImpl _value,
    $Res Function(_$ExplainabilityAttributionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExplainabilityAttribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
    Object? method = null,
    Object? targetClass = freezed,
    Object? globalTargetLayer = freezed,
    Object? roiTargetLayer = freezed,
    Object? fusionMethod = freezed,
    Object? academicNotice = freezed,
  }) {
    return _then(
      _$ExplainabilityAttributionImpl(
        available: null == available
            ? _value.available
            : available // ignore: cast_nullable_to_non_nullable
                  as bool,
        method: null == method
            ? _value.method
            : method // ignore: cast_nullable_to_non_nullable
                  as String,
        targetClass: freezed == targetClass
            ? _value.targetClass
            : targetClass // ignore: cast_nullable_to_non_nullable
                  as String?,
        globalTargetLayer: freezed == globalTargetLayer
            ? _value.globalTargetLayer
            : globalTargetLayer // ignore: cast_nullable_to_non_nullable
                  as String?,
        roiTargetLayer: freezed == roiTargetLayer
            ? _value.roiTargetLayer
            : roiTargetLayer // ignore: cast_nullable_to_non_nullable
                  as String?,
        fusionMethod: freezed == fusionMethod
            ? _value.fusionMethod
            : fusionMethod // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$ExplainabilityAttributionImpl implements _ExplainabilityAttribution {
  const _$ExplainabilityAttributionImpl({
    this.available = false,
    this.method = 'Grad-CAM (Dual-Branch ResNet34)',
    @JsonKey(name: 'target_class') this.targetClass,
    @JsonKey(name: 'global_target_layer') this.globalTargetLayer,
    @JsonKey(name: 'roi_target_layer') this.roiTargetLayer,
    @JsonKey(name: 'fusion_method') this.fusionMethod,
    @JsonKey(name: 'academic_notice') this.academicNotice,
  });

  factory _$ExplainabilityAttributionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExplainabilityAttributionImplFromJson(json);

  @override
  @JsonKey()
  final bool available;
  @override
  @JsonKey()
  final String method;
  @override
  @JsonKey(name: 'target_class')
  final String? targetClass;
  @override
  @JsonKey(name: 'global_target_layer')
  final String? globalTargetLayer;
  @override
  @JsonKey(name: 'roi_target_layer')
  final String? roiTargetLayer;
  @override
  @JsonKey(name: 'fusion_method')
  final String? fusionMethod;
  @override
  @JsonKey(name: 'academic_notice')
  final String? academicNotice;

  @override
  String toString() {
    return 'ExplainabilityAttribution(available: $available, method: $method, targetClass: $targetClass, globalTargetLayer: $globalTargetLayer, roiTargetLayer: $roiTargetLayer, fusionMethod: $fusionMethod, academicNotice: $academicNotice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExplainabilityAttributionImpl &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.targetClass, targetClass) ||
                other.targetClass == targetClass) &&
            (identical(other.globalTargetLayer, globalTargetLayer) ||
                other.globalTargetLayer == globalTargetLayer) &&
            (identical(other.roiTargetLayer, roiTargetLayer) ||
                other.roiTargetLayer == roiTargetLayer) &&
            (identical(other.fusionMethod, fusionMethod) ||
                other.fusionMethod == fusionMethod) &&
            (identical(other.academicNotice, academicNotice) ||
                other.academicNotice == academicNotice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    available,
    method,
    targetClass,
    globalTargetLayer,
    roiTargetLayer,
    fusionMethod,
    academicNotice,
  );

  /// Create a copy of ExplainabilityAttribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExplainabilityAttributionImplCopyWith<_$ExplainabilityAttributionImpl>
  get copyWith =>
      __$$ExplainabilityAttributionImplCopyWithImpl<
        _$ExplainabilityAttributionImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExplainabilityAttributionImplToJson(this);
  }
}

abstract class _ExplainabilityAttribution implements ExplainabilityAttribution {
  const factory _ExplainabilityAttribution({
    final bool available,
    final String method,
    @JsonKey(name: 'target_class') final String? targetClass,
    @JsonKey(name: 'global_target_layer') final String? globalTargetLayer,
    @JsonKey(name: 'roi_target_layer') final String? roiTargetLayer,
    @JsonKey(name: 'fusion_method') final String? fusionMethod,
    @JsonKey(name: 'academic_notice') final String? academicNotice,
  }) = _$ExplainabilityAttributionImpl;

  factory _ExplainabilityAttribution.fromJson(Map<String, dynamic> json) =
      _$ExplainabilityAttributionImpl.fromJson;

  @override
  bool get available;
  @override
  String get method;
  @override
  @JsonKey(name: 'target_class')
  String? get targetClass;
  @override
  @JsonKey(name: 'global_target_layer')
  String? get globalTargetLayer;
  @override
  @JsonKey(name: 'roi_target_layer')
  String? get roiTargetLayer;
  @override
  @JsonKey(name: 'fusion_method')
  String? get fusionMethod;
  @override
  @JsonKey(name: 'academic_notice')
  String? get academicNotice;

  /// Create a copy of ExplainabilityAttribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExplainabilityAttributionImplCopyWith<_$ExplainabilityAttributionImpl>
  get copyWith => throw _privateConstructorUsedError;
}
