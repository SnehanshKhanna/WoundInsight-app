// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wound.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Wound _$WoundFromJson(Map<String, dynamic> json) {
  return _Wound.fromJson(json);
}

/// @nodoc
mixin _$Wound {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Wound to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Wound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WoundCopyWith<Wound> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WoundCopyWith<$Res> {
  factory $WoundCopyWith(Wound value, $Res Function(Wound) then) =
      _$WoundCopyWithImpl<$Res, Wound>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    String name,
    String? location,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class _$WoundCopyWithImpl<$Res, $Val extends Wound>
    implements $WoundCopyWith<$Res> {
  _$WoundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Wound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? location = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WoundImplCopyWith<$Res> implements $WoundCopyWith<$Res> {
  factory _$$WoundImplCopyWith(
    _$WoundImpl value,
    $Res Function(_$WoundImpl) then,
  ) = __$$WoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    String name,
    String? location,
    @JsonKey(name: 'created_at') String createdAt,
  });
}

/// @nodoc
class __$$WoundImplCopyWithImpl<$Res>
    extends _$WoundCopyWithImpl<$Res, _$WoundImpl>
    implements _$$WoundImplCopyWith<$Res> {
  __$$WoundImplCopyWithImpl(
    _$WoundImpl _value,
    $Res Function(_$WoundImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Wound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? location = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$WoundImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WoundImpl implements _Wound {
  const _$WoundImpl({
    required this.id,
    @JsonKey(name: 'user_id') required this.userId,
    required this.name,
    this.location,
    @JsonKey(name: 'created_at') required this.createdAt,
  });

  factory _$WoundImpl.fromJson(Map<String, dynamic> json) =>
      _$$WoundImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String name;
  @override
  final String? location;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'Wound(id: $id, userId: $userId, name: $name, location: $location, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WoundImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, name, location, createdAt);

  /// Create a copy of Wound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WoundImplCopyWith<_$WoundImpl> get copyWith =>
      __$$WoundImplCopyWithImpl<_$WoundImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WoundImplToJson(this);
  }
}

abstract class _Wound implements Wound {
  const factory _Wound({
    required final String id,
    @JsonKey(name: 'user_id') required final String userId,
    required final String name,
    final String? location,
    @JsonKey(name: 'created_at') required final String createdAt,
  }) = _$WoundImpl;

  factory _Wound.fromJson(Map<String, dynamic> json) = _$WoundImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  String get name;
  @override
  String? get location;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of Wound
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WoundImplCopyWith<_$WoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
