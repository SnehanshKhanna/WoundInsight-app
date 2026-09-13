import 'package:freezed_annotation/freezed_annotation.dart';

part 'wound.freezed.dart';
part 'wound.g.dart';

@freezed
class Wound with _$Wound {
  const factory Wound({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String name,
    String? location,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Wound;

  factory Wound.fromJson(Map<String, dynamic> json) => _$WoundFromJson(json);
}
