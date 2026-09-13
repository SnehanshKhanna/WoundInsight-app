// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AnalysisListResponse _$AnalysisListResponseFromJson(Map<String, dynamic> json) {
  return _AnalysisListResponse.fromJson(json);
}

/// @nodoc
mixin _$AnalysisListResponse {
  int get total => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  List<AnalysisSummaryItem> get analyses => throw _privateConstructorUsedError;

  /// Serializes this AnalysisListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalysisListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalysisListResponseCopyWith<AnalysisListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisListResponseCopyWith<$Res> {
  factory $AnalysisListResponseCopyWith(
    AnalysisListResponse value,
    $Res Function(AnalysisListResponse) then,
  ) = _$AnalysisListResponseCopyWithImpl<$Res, AnalysisListResponse>;
  @useResult
  $Res call({
    int total,
    int limit,
    int offset,
    List<AnalysisSummaryItem> analyses,
  });
}

/// @nodoc
class _$AnalysisListResponseCopyWithImpl<
  $Res,
  $Val extends AnalysisListResponse
>
    implements $AnalysisListResponseCopyWith<$Res> {
  _$AnalysisListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalysisListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? limit = null,
    Object? offset = null,
    Object? analyses = null,
  }) {
    return _then(
      _value.copyWith(
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int,
            offset: null == offset
                ? _value.offset
                : offset // ignore: cast_nullable_to_non_nullable
                      as int,
            analyses: null == analyses
                ? _value.analyses
                : analyses // ignore: cast_nullable_to_non_nullable
                      as List<AnalysisSummaryItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnalysisListResponseImplCopyWith<$Res>
    implements $AnalysisListResponseCopyWith<$Res> {
  factory _$$AnalysisListResponseImplCopyWith(
    _$AnalysisListResponseImpl value,
    $Res Function(_$AnalysisListResponseImpl) then,
  ) = __$$AnalysisListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int total,
    int limit,
    int offset,
    List<AnalysisSummaryItem> analyses,
  });
}

/// @nodoc
class __$$AnalysisListResponseImplCopyWithImpl<$Res>
    extends _$AnalysisListResponseCopyWithImpl<$Res, _$AnalysisListResponseImpl>
    implements _$$AnalysisListResponseImplCopyWith<$Res> {
  __$$AnalysisListResponseImplCopyWithImpl(
    _$AnalysisListResponseImpl _value,
    $Res Function(_$AnalysisListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalysisListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? limit = null,
    Object? offset = null,
    Object? analyses = null,
  }) {
    return _then(
      _$AnalysisListResponseImpl(
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        offset: null == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int,
        analyses: null == analyses
            ? _value._analyses
            : analyses // ignore: cast_nullable_to_non_nullable
                  as List<AnalysisSummaryItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalysisListResponseImpl implements _AnalysisListResponse {
  const _$AnalysisListResponseImpl({
    required this.total,
    required this.limit,
    required this.offset,
    required final List<AnalysisSummaryItem> analyses,
  }) : _analyses = analyses;

  factory _$AnalysisListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalysisListResponseImplFromJson(json);

  @override
  final int total;
  @override
  final int limit;
  @override
  final int offset;
  final List<AnalysisSummaryItem> _analyses;
  @override
  List<AnalysisSummaryItem> get analyses {
    if (_analyses is EqualUnmodifiableListView) return _analyses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analyses);
  }

  @override
  String toString() {
    return 'AnalysisListResponse(total: $total, limit: $limit, offset: $offset, analyses: $analyses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisListResponseImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            const DeepCollectionEquality().equals(other._analyses, _analyses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    total,
    limit,
    offset,
    const DeepCollectionEquality().hash(_analyses),
  );

  /// Create a copy of AnalysisListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisListResponseImplCopyWith<_$AnalysisListResponseImpl>
  get copyWith =>
      __$$AnalysisListResponseImplCopyWithImpl<_$AnalysisListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalysisListResponseImplToJson(this);
  }
}

abstract class _AnalysisListResponse implements AnalysisListResponse {
  const factory _AnalysisListResponse({
    required final int total,
    required final int limit,
    required final int offset,
    required final List<AnalysisSummaryItem> analyses,
  }) = _$AnalysisListResponseImpl;

  factory _AnalysisListResponse.fromJson(Map<String, dynamic> json) =
      _$AnalysisListResponseImpl.fromJson;

  @override
  int get total;
  @override
  int get limit;
  @override
  int get offset;
  @override
  List<AnalysisSummaryItem> get analyses;

  /// Create a copy of AnalysisListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalysisListResponseImplCopyWith<_$AnalysisListResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
