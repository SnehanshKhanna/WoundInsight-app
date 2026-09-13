// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wound.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WoundImpl _$$WoundImplFromJson(Map<String, dynamic> json) => _$WoundImpl(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  name: json['name'] as String,
  location: json['location'] as String?,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$$WoundImplToJson(_$WoundImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'location': instance.location,
      'created_at': instance.createdAt,
    };
