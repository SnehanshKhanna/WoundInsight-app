// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wound_morphometrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WoundMorphometrics _$WoundMorphometricsFromJson(Map<String, dynamic> json) {
  return _WoundMorphometrics.fromJson(json);
}

/// @nodoc
mixin _$WoundMorphometrics {
  bool get detected => throw _privateConstructorUsedError;
  @JsonKey(name: 'area_pixels')
  int get areaPixels => throw _privateConstructorUsedError;
  @JsonKey(name: 'area_cm2')
  double get areaCm2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'perimeter_mm')
  double get perimeterMm => throw _privateConstructorUsedError;
  double get circularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_irregular')
  bool get isIrregular => throw _privateConstructorUsedError;

  /// Serializes this WoundMorphometrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WoundMorphometrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WoundMorphometricsCopyWith<WoundMorphometrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WoundMorphometricsCopyWith<$Res> {
  factory $WoundMorphometricsCopyWith(
    WoundMorphometrics value,
    $Res Function(WoundMorphometrics) then,
  ) = _$WoundMorphometricsCopyWithImpl<$Res, WoundMorphometrics>;
  @useResult
  $Res call({
    bool detected,
    @JsonKey(name: 'area_pixels') int areaPixels,
    @JsonKey(name: 'area_cm2') double areaCm2,
    @JsonKey(name: 'perimeter_mm') double perimeterMm,
    double circularity,
    @JsonKey(name: 'is_irregular') bool isIrregular,
  });
}

/// @nodoc
class _$WoundMorphometricsCopyWithImpl<$Res, $Val extends WoundMorphometrics>
    implements $WoundMorphometricsCopyWith<$Res> {
  _$WoundMorphometricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WoundMorphometrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detected = null,
    Object? areaPixels = null,
    Object? areaCm2 = null,
    Object? perimeterMm = null,
    Object? circularity = null,
    Object? isIrregular = null,
  }) {
    return _then(
      _value.copyWith(
            detected: null == detected
                ? _value.detected
                : detected // ignore: cast_nullable_to_non_nullable
                      as bool,
            areaPixels: null == areaPixels
                ? _value.areaPixels
                : areaPixels // ignore: cast_nullable_to_non_nullable
                      as int,
            areaCm2: null == areaCm2
                ? _value.areaCm2
                : areaCm2 // ignore: cast_nullable_to_non_nullable
                      as double,
            perimeterMm: null == perimeterMm
                ? _value.perimeterMm
                : perimeterMm // ignore: cast_nullable_to_non_nullable
                      as double,
            circularity: null == circularity
                ? _value.circularity
                : circularity // ignore: cast_nullable_to_non_nullable
                      as double,
            isIrregular: null == isIrregular
                ? _value.isIrregular
                : isIrregular // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WoundMorphometricsImplCopyWith<$Res>
    implements $WoundMorphometricsCopyWith<$Res> {
  factory _$$WoundMorphometricsImplCopyWith(
    _$WoundMorphometricsImpl value,
    $Res Function(_$WoundMorphometricsImpl) then,
  ) = __$$WoundMorphometricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool detected,
    @JsonKey(name: 'area_pixels') int areaPixels,
    @JsonKey(name: 'area_cm2') double areaCm2,
    @JsonKey(name: 'perimeter_mm') double perimeterMm,
    double circularity,
    @JsonKey(name: 'is_irregular') bool isIrregular,
  });
}

/// @nodoc
class __$$WoundMorphometricsImplCopyWithImpl<$Res>
    extends _$WoundMorphometricsCopyWithImpl<$Res, _$WoundMorphometricsImpl>
    implements _$$WoundMorphometricsImplCopyWith<$Res> {
  __$$WoundMorphometricsImplCopyWithImpl(
    _$WoundMorphometricsImpl _value,
    $Res Function(_$WoundMorphometricsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WoundMorphometrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detected = null,
    Object? areaPixels = null,
    Object? areaCm2 = null,
    Object? perimeterMm = null,
    Object? circularity = null,
    Object? isIrregular = null,
  }) {
    return _then(
      _$WoundMorphometricsImpl(
        detected: null == detected
            ? _value.detected
            : detected // ignore: cast_nullable_to_non_nullable
                  as bool,
        areaPixels: null == areaPixels
            ? _value.areaPixels
            : areaPixels // ignore: cast_nullable_to_non_nullable
                  as int,
        areaCm2: null == areaCm2
            ? _value.areaCm2
            : areaCm2 // ignore: cast_nullable_to_non_nullable
                  as double,
        perimeterMm: null == perimeterMm
            ? _value.perimeterMm
            : perimeterMm // ignore: cast_nullable_to_non_nullable
                  as double,
        circularity: null == circularity
            ? _value.circularity
            : circularity // ignore: cast_nullable_to_non_nullable
                  as double,
        isIrregular: null == isIrregular
            ? _value.isIrregular
            : isIrregular // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WoundMorphometricsImpl implements _WoundMorphometrics {
  const _$WoundMorphometricsImpl({
    required this.detected,
    @JsonKey(name: 'area_pixels') required this.areaPixels,
    @JsonKey(name: 'area_cm2') required this.areaCm2,
    @JsonKey(name: 'perimeter_mm') required this.perimeterMm,
    required this.circularity,
    @JsonKey(name: 'is_irregular') required this.isIrregular,
  });

  factory _$WoundMorphometricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WoundMorphometricsImplFromJson(json);

  @override
  final bool detected;
  @override
  @JsonKey(name: 'area_pixels')
  final int areaPixels;
  @override
  @JsonKey(name: 'area_cm2')
  final double areaCm2;
  @override
  @JsonKey(name: 'perimeter_mm')
  final double perimeterMm;
  @override
  final double circularity;
  @override
  @JsonKey(name: 'is_irregular')
  final bool isIrregular;

  @override
  String toString() {
    return 'WoundMorphometrics(detected: $detected, areaPixels: $areaPixels, areaCm2: $areaCm2, perimeterMm: $perimeterMm, circularity: $circularity, isIrregular: $isIrregular)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WoundMorphometricsImpl &&
            (identical(other.detected, detected) ||
                other.detected == detected) &&
            (identical(other.areaPixels, areaPixels) ||
                other.areaPixels == areaPixels) &&
            (identical(other.areaCm2, areaCm2) || other.areaCm2 == areaCm2) &&
            (identical(other.perimeterMm, perimeterMm) ||
                other.perimeterMm == perimeterMm) &&
            (identical(other.circularity, circularity) ||
                other.circularity == circularity) &&
            (identical(other.isIrregular, isIrregular) ||
                other.isIrregular == isIrregular));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    detected,
    areaPixels,
    areaCm2,
    perimeterMm,
    circularity,
    isIrregular,
  );

  /// Create a copy of WoundMorphometrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WoundMorphometricsImplCopyWith<_$WoundMorphometricsImpl> get copyWith =>
      __$$WoundMorphometricsImplCopyWithImpl<_$WoundMorphometricsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WoundMorphometricsImplToJson(this);
  }
}

abstract class _WoundMorphometrics implements WoundMorphometrics {
  const factory _WoundMorphometrics({
    required final bool detected,
    @JsonKey(name: 'area_pixels') required final int areaPixels,
    @JsonKey(name: 'area_cm2') required final double areaCm2,
    @JsonKey(name: 'perimeter_mm') required final double perimeterMm,
    required final double circularity,
    @JsonKey(name: 'is_irregular') required final bool isIrregular,
  }) = _$WoundMorphometricsImpl;

  factory _WoundMorphometrics.fromJson(Map<String, dynamic> json) =
      _$WoundMorphometricsImpl.fromJson;

  @override
  bool get detected;
  @override
  @JsonKey(name: 'area_pixels')
  int get areaPixels;
  @override
  @JsonKey(name: 'area_cm2')
  double get areaCm2;
  @override
  @JsonKey(name: 'perimeter_mm')
  double get perimeterMm;
  @override
  double get circularity;
  @override
  @JsonKey(name: 'is_irregular')
  bool get isIrregular;

  /// Create a copy of WoundMorphometrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WoundMorphometricsImplCopyWith<_$WoundMorphometricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
