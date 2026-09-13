// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visual_outputs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VisualOutputs _$VisualOutputsFromJson(Map<String, dynamic> json) {
  return _VisualOutputs.fromJson(json);
}

/// @nodoc
mixin _$VisualOutputs {
  @JsonKey(name: 'report_image_url')
  String get reportImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'report_filename')
  String get reportFilename => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_image_url')
  String? get originalImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'gradcam_image_url')
  String? get gradcamImageUrl => throw _privateConstructorUsedError;

  /// Serializes this VisualOutputs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VisualOutputs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisualOutputsCopyWith<VisualOutputs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisualOutputsCopyWith<$Res> {
  factory $VisualOutputsCopyWith(
    VisualOutputs value,
    $Res Function(VisualOutputs) then,
  ) = _$VisualOutputsCopyWithImpl<$Res, VisualOutputs>;
  @useResult
  $Res call({
    @JsonKey(name: 'report_image_url') String reportImageUrl,
    @JsonKey(name: 'report_filename') String reportFilename,
    @JsonKey(name: 'original_image_url') String? originalImageUrl,
    @JsonKey(name: 'gradcam_image_url') String? gradcamImageUrl,
  });
}

/// @nodoc
class _$VisualOutputsCopyWithImpl<$Res, $Val extends VisualOutputs>
    implements $VisualOutputsCopyWith<$Res> {
  _$VisualOutputsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisualOutputs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportImageUrl = null,
    Object? reportFilename = null,
    Object? originalImageUrl = freezed,
    Object? gradcamImageUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            reportImageUrl: null == reportImageUrl
                ? _value.reportImageUrl
                : reportImageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            reportFilename: null == reportFilename
                ? _value.reportFilename
                : reportFilename // ignore: cast_nullable_to_non_nullable
                      as String,
            originalImageUrl: freezed == originalImageUrl
                ? _value.originalImageUrl
                : originalImageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            gradcamImageUrl: freezed == gradcamImageUrl
                ? _value.gradcamImageUrl
                : gradcamImageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VisualOutputsImplCopyWith<$Res>
    implements $VisualOutputsCopyWith<$Res> {
  factory _$$VisualOutputsImplCopyWith(
    _$VisualOutputsImpl value,
    $Res Function(_$VisualOutputsImpl) then,
  ) = __$$VisualOutputsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'report_image_url') String reportImageUrl,
    @JsonKey(name: 'report_filename') String reportFilename,
    @JsonKey(name: 'original_image_url') String? originalImageUrl,
    @JsonKey(name: 'gradcam_image_url') String? gradcamImageUrl,
  });
}

/// @nodoc
class __$$VisualOutputsImplCopyWithImpl<$Res>
    extends _$VisualOutputsCopyWithImpl<$Res, _$VisualOutputsImpl>
    implements _$$VisualOutputsImplCopyWith<$Res> {
  __$$VisualOutputsImplCopyWithImpl(
    _$VisualOutputsImpl _value,
    $Res Function(_$VisualOutputsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VisualOutputs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportImageUrl = null,
    Object? reportFilename = null,
    Object? originalImageUrl = freezed,
    Object? gradcamImageUrl = freezed,
  }) {
    return _then(
      _$VisualOutputsImpl(
        reportImageUrl: null == reportImageUrl
            ? _value.reportImageUrl
            : reportImageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        reportFilename: null == reportFilename
            ? _value.reportFilename
            : reportFilename // ignore: cast_nullable_to_non_nullable
                  as String,
        originalImageUrl: freezed == originalImageUrl
            ? _value.originalImageUrl
            : originalImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        gradcamImageUrl: freezed == gradcamImageUrl
            ? _value.gradcamImageUrl
            : gradcamImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VisualOutputsImpl implements _VisualOutputs {
  const _$VisualOutputsImpl({
    @JsonKey(name: 'report_image_url') required this.reportImageUrl,
    @JsonKey(name: 'report_filename') required this.reportFilename,
    @JsonKey(name: 'original_image_url') this.originalImageUrl,
    @JsonKey(name: 'gradcam_image_url') this.gradcamImageUrl,
  });

  factory _$VisualOutputsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisualOutputsImplFromJson(json);

  @override
  @JsonKey(name: 'report_image_url')
  final String reportImageUrl;
  @override
  @JsonKey(name: 'report_filename')
  final String reportFilename;
  @override
  @JsonKey(name: 'original_image_url')
  final String? originalImageUrl;
  @override
  @JsonKey(name: 'gradcam_image_url')
  final String? gradcamImageUrl;

  @override
  String toString() {
    return 'VisualOutputs(reportImageUrl: $reportImageUrl, reportFilename: $reportFilename, originalImageUrl: $originalImageUrl, gradcamImageUrl: $gradcamImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisualOutputsImpl &&
            (identical(other.reportImageUrl, reportImageUrl) ||
                other.reportImageUrl == reportImageUrl) &&
            (identical(other.reportFilename, reportFilename) ||
                other.reportFilename == reportFilename) &&
            (identical(other.originalImageUrl, originalImageUrl) ||
                other.originalImageUrl == originalImageUrl) &&
            (identical(other.gradcamImageUrl, gradcamImageUrl) ||
                other.gradcamImageUrl == gradcamImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    reportImageUrl,
    reportFilename,
    originalImageUrl,
    gradcamImageUrl,
  );

  /// Create a copy of VisualOutputs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisualOutputsImplCopyWith<_$VisualOutputsImpl> get copyWith =>
      __$$VisualOutputsImplCopyWithImpl<_$VisualOutputsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisualOutputsImplToJson(this);
  }
}

abstract class _VisualOutputs implements VisualOutputs {
  const factory _VisualOutputs({
    @JsonKey(name: 'report_image_url') required final String reportImageUrl,
    @JsonKey(name: 'report_filename') required final String reportFilename,
    @JsonKey(name: 'original_image_url') final String? originalImageUrl,
    @JsonKey(name: 'gradcam_image_url') final String? gradcamImageUrl,
  }) = _$VisualOutputsImpl;

  factory _VisualOutputs.fromJson(Map<String, dynamic> json) =
      _$VisualOutputsImpl.fromJson;

  @override
  @JsonKey(name: 'report_image_url')
  String get reportImageUrl;
  @override
  @JsonKey(name: 'report_filename')
  String get reportFilename;
  @override
  @JsonKey(name: 'original_image_url')
  String? get originalImageUrl;
  @override
  @JsonKey(name: 'gradcam_image_url')
  String? get gradcamImageUrl;

  /// Create a copy of VisualOutputs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisualOutputsImplCopyWith<_$VisualOutputsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
