// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'etiology_diagnostics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EtiologyProbabilities _$EtiologyProbabilitiesFromJson(
  Map<String, dynamic> json,
) {
  return _EtiologyProbabilities.fromJson(json);
}

/// @nodoc
mixin _$EtiologyProbabilities {
  @JsonKey(name: 'DFU', defaultValue: 0.0)
  double get dfu => throw _privateConstructorUsedError;
  @JsonKey(name: 'Pressure', defaultValue: 0.0)
  double get pressure => throw _privateConstructorUsedError;
  @JsonKey(name: 'Surgical', defaultValue: 0.0)
  double get surgical => throw _privateConstructorUsedError;
  @JsonKey(name: 'Venous', defaultValue: 0.0)
  double get venous => throw _privateConstructorUsedError;

  /// Serializes this EtiologyProbabilities to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EtiologyProbabilities
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EtiologyProbabilitiesCopyWith<EtiologyProbabilities> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EtiologyProbabilitiesCopyWith<$Res> {
  factory $EtiologyProbabilitiesCopyWith(
    EtiologyProbabilities value,
    $Res Function(EtiologyProbabilities) then,
  ) = _$EtiologyProbabilitiesCopyWithImpl<$Res, EtiologyProbabilities>;
  @useResult
  $Res call({
    @JsonKey(name: 'DFU', defaultValue: 0.0) double dfu,
    @JsonKey(name: 'Pressure', defaultValue: 0.0) double pressure,
    @JsonKey(name: 'Surgical', defaultValue: 0.0) double surgical,
    @JsonKey(name: 'Venous', defaultValue: 0.0) double venous,
  });
}

/// @nodoc
class _$EtiologyProbabilitiesCopyWithImpl<
  $Res,
  $Val extends EtiologyProbabilities
>
    implements $EtiologyProbabilitiesCopyWith<$Res> {
  _$EtiologyProbabilitiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EtiologyProbabilities
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dfu = null,
    Object? pressure = null,
    Object? surgical = null,
    Object? venous = null,
  }) {
    return _then(
      _value.copyWith(
            dfu: null == dfu
                ? _value.dfu
                : dfu // ignore: cast_nullable_to_non_nullable
                      as double,
            pressure: null == pressure
                ? _value.pressure
                : pressure // ignore: cast_nullable_to_non_nullable
                      as double,
            surgical: null == surgical
                ? _value.surgical
                : surgical // ignore: cast_nullable_to_non_nullable
                      as double,
            venous: null == venous
                ? _value.venous
                : venous // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EtiologyProbabilitiesImplCopyWith<$Res>
    implements $EtiologyProbabilitiesCopyWith<$Res> {
  factory _$$EtiologyProbabilitiesImplCopyWith(
    _$EtiologyProbabilitiesImpl value,
    $Res Function(_$EtiologyProbabilitiesImpl) then,
  ) = __$$EtiologyProbabilitiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'DFU', defaultValue: 0.0) double dfu,
    @JsonKey(name: 'Pressure', defaultValue: 0.0) double pressure,
    @JsonKey(name: 'Surgical', defaultValue: 0.0) double surgical,
    @JsonKey(name: 'Venous', defaultValue: 0.0) double venous,
  });
}

/// @nodoc
class __$$EtiologyProbabilitiesImplCopyWithImpl<$Res>
    extends
        _$EtiologyProbabilitiesCopyWithImpl<$Res, _$EtiologyProbabilitiesImpl>
    implements _$$EtiologyProbabilitiesImplCopyWith<$Res> {
  __$$EtiologyProbabilitiesImplCopyWithImpl(
    _$EtiologyProbabilitiesImpl _value,
    $Res Function(_$EtiologyProbabilitiesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EtiologyProbabilities
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dfu = null,
    Object? pressure = null,
    Object? surgical = null,
    Object? venous = null,
  }) {
    return _then(
      _$EtiologyProbabilitiesImpl(
        dfu: null == dfu
            ? _value.dfu
            : dfu // ignore: cast_nullable_to_non_nullable
                  as double,
        pressure: null == pressure
            ? _value.pressure
            : pressure // ignore: cast_nullable_to_non_nullable
                  as double,
        surgical: null == surgical
            ? _value.surgical
            : surgical // ignore: cast_nullable_to_non_nullable
                  as double,
        venous: null == venous
            ? _value.venous
            : venous // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EtiologyProbabilitiesImpl implements _EtiologyProbabilities {
  const _$EtiologyProbabilitiesImpl({
    @JsonKey(name: 'DFU', defaultValue: 0.0) required this.dfu,
    @JsonKey(name: 'Pressure', defaultValue: 0.0) required this.pressure,
    @JsonKey(name: 'Surgical', defaultValue: 0.0) required this.surgical,
    @JsonKey(name: 'Venous', defaultValue: 0.0) required this.venous,
  });

  factory _$EtiologyProbabilitiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$EtiologyProbabilitiesImplFromJson(json);

  @override
  @JsonKey(name: 'DFU', defaultValue: 0.0)
  final double dfu;
  @override
  @JsonKey(name: 'Pressure', defaultValue: 0.0)
  final double pressure;
  @override
  @JsonKey(name: 'Surgical', defaultValue: 0.0)
  final double surgical;
  @override
  @JsonKey(name: 'Venous', defaultValue: 0.0)
  final double venous;

  @override
  String toString() {
    return 'EtiologyProbabilities(dfu: $dfu, pressure: $pressure, surgical: $surgical, venous: $venous)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EtiologyProbabilitiesImpl &&
            (identical(other.dfu, dfu) || other.dfu == dfu) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.surgical, surgical) ||
                other.surgical == surgical) &&
            (identical(other.venous, venous) || other.venous == venous));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dfu, pressure, surgical, venous);

  /// Create a copy of EtiologyProbabilities
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EtiologyProbabilitiesImplCopyWith<_$EtiologyProbabilitiesImpl>
  get copyWith =>
      __$$EtiologyProbabilitiesImplCopyWithImpl<_$EtiologyProbabilitiesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EtiologyProbabilitiesImplToJson(this);
  }
}

abstract class _EtiologyProbabilities implements EtiologyProbabilities {
  const factory _EtiologyProbabilities({
    @JsonKey(name: 'DFU', defaultValue: 0.0) required final double dfu,
    @JsonKey(name: 'Pressure', defaultValue: 0.0)
    required final double pressure,
    @JsonKey(name: 'Surgical', defaultValue: 0.0)
    required final double surgical,
    @JsonKey(name: 'Venous', defaultValue: 0.0) required final double venous,
  }) = _$EtiologyProbabilitiesImpl;

  factory _EtiologyProbabilities.fromJson(Map<String, dynamic> json) =
      _$EtiologyProbabilitiesImpl.fromJson;

  @override
  @JsonKey(name: 'DFU', defaultValue: 0.0)
  double get dfu;
  @override
  @JsonKey(name: 'Pressure', defaultValue: 0.0)
  double get pressure;
  @override
  @JsonKey(name: 'Surgical', defaultValue: 0.0)
  double get surgical;
  @override
  @JsonKey(name: 'Venous', defaultValue: 0.0)
  double get venous;

  /// Create a copy of EtiologyProbabilities
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EtiologyProbabilitiesImplCopyWith<_$EtiologyProbabilitiesImpl>
  get copyWith => throw _privateConstructorUsedError;
}

EtiologyDiagnostics _$EtiologyDiagnosticsFromJson(Map<String, dynamic> json) {
  return _EtiologyDiagnostics.fromJson(json);
}

/// @nodoc
mixin _$EtiologyDiagnostics {
  @JsonKey(name: 'predicted_type')
  String get predictedType => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  EtiologyProbabilities get probabilities => throw _privateConstructorUsedError;

  /// Serializes this EtiologyDiagnostics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EtiologyDiagnostics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EtiologyDiagnosticsCopyWith<EtiologyDiagnostics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EtiologyDiagnosticsCopyWith<$Res> {
  factory $EtiologyDiagnosticsCopyWith(
    EtiologyDiagnostics value,
    $Res Function(EtiologyDiagnostics) then,
  ) = _$EtiologyDiagnosticsCopyWithImpl<$Res, EtiologyDiagnostics>;
  @useResult
  $Res call({
    @JsonKey(name: 'predicted_type') String predictedType,
    double confidence,
    EtiologyProbabilities probabilities,
  });

  $EtiologyProbabilitiesCopyWith<$Res> get probabilities;
}

/// @nodoc
class _$EtiologyDiagnosticsCopyWithImpl<$Res, $Val extends EtiologyDiagnostics>
    implements $EtiologyDiagnosticsCopyWith<$Res> {
  _$EtiologyDiagnosticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EtiologyDiagnostics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predictedType = null,
    Object? confidence = null,
    Object? probabilities = null,
  }) {
    return _then(
      _value.copyWith(
            predictedType: null == predictedType
                ? _value.predictedType
                : predictedType // ignore: cast_nullable_to_non_nullable
                      as String,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
            probabilities: null == probabilities
                ? _value.probabilities
                : probabilities // ignore: cast_nullable_to_non_nullable
                      as EtiologyProbabilities,
          )
          as $Val,
    );
  }

  /// Create a copy of EtiologyDiagnostics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EtiologyProbabilitiesCopyWith<$Res> get probabilities {
    return $EtiologyProbabilitiesCopyWith<$Res>(_value.probabilities, (value) {
      return _then(_value.copyWith(probabilities: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EtiologyDiagnosticsImplCopyWith<$Res>
    implements $EtiologyDiagnosticsCopyWith<$Res> {
  factory _$$EtiologyDiagnosticsImplCopyWith(
    _$EtiologyDiagnosticsImpl value,
    $Res Function(_$EtiologyDiagnosticsImpl) then,
  ) = __$$EtiologyDiagnosticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'predicted_type') String predictedType,
    double confidence,
    EtiologyProbabilities probabilities,
  });

  @override
  $EtiologyProbabilitiesCopyWith<$Res> get probabilities;
}

/// @nodoc
class __$$EtiologyDiagnosticsImplCopyWithImpl<$Res>
    extends _$EtiologyDiagnosticsCopyWithImpl<$Res, _$EtiologyDiagnosticsImpl>
    implements _$$EtiologyDiagnosticsImplCopyWith<$Res> {
  __$$EtiologyDiagnosticsImplCopyWithImpl(
    _$EtiologyDiagnosticsImpl _value,
    $Res Function(_$EtiologyDiagnosticsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EtiologyDiagnostics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predictedType = null,
    Object? confidence = null,
    Object? probabilities = null,
  }) {
    return _then(
      _$EtiologyDiagnosticsImpl(
        predictedType: null == predictedType
            ? _value.predictedType
            : predictedType // ignore: cast_nullable_to_non_nullable
                  as String,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
        probabilities: null == probabilities
            ? _value.probabilities
            : probabilities // ignore: cast_nullable_to_non_nullable
                  as EtiologyProbabilities,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EtiologyDiagnosticsImpl implements _EtiologyDiagnostics {
  const _$EtiologyDiagnosticsImpl({
    @JsonKey(name: 'predicted_type') required this.predictedType,
    required this.confidence,
    required this.probabilities,
  });

  factory _$EtiologyDiagnosticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EtiologyDiagnosticsImplFromJson(json);

  @override
  @JsonKey(name: 'predicted_type')
  final String predictedType;
  @override
  final double confidence;
  @override
  final EtiologyProbabilities probabilities;

  @override
  String toString() {
    return 'EtiologyDiagnostics(predictedType: $predictedType, confidence: $confidence, probabilities: $probabilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EtiologyDiagnosticsImpl &&
            (identical(other.predictedType, predictedType) ||
                other.predictedType == predictedType) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.probabilities, probabilities) ||
                other.probabilities == probabilities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, predictedType, confidence, probabilities);

  /// Create a copy of EtiologyDiagnostics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EtiologyDiagnosticsImplCopyWith<_$EtiologyDiagnosticsImpl> get copyWith =>
      __$$EtiologyDiagnosticsImplCopyWithImpl<_$EtiologyDiagnosticsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EtiologyDiagnosticsImplToJson(this);
  }
}

abstract class _EtiologyDiagnostics implements EtiologyDiagnostics {
  const factory _EtiologyDiagnostics({
    @JsonKey(name: 'predicted_type') required final String predictedType,
    required final double confidence,
    required final EtiologyProbabilities probabilities,
  }) = _$EtiologyDiagnosticsImpl;

  factory _EtiologyDiagnostics.fromJson(Map<String, dynamic> json) =
      _$EtiologyDiagnosticsImpl.fromJson;

  @override
  @JsonKey(name: 'predicted_type')
  String get predictedType;
  @override
  double get confidence;
  @override
  EtiologyProbabilities get probabilities;

  /// Create a copy of EtiologyDiagnostics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EtiologyDiagnosticsImplCopyWith<_$EtiologyDiagnosticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
