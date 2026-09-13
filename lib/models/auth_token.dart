import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wound_insight_app/models/user.dart';

part 'auth_token.freezed.dart';
part 'auth_token.g.dart';

@freezed
class AuthToken with _$AuthToken {
  const factory AuthToken({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type', defaultValue: 'bearer') required String tokenType,
    required User user,
  }) = _AuthToken;

  factory AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);
}
