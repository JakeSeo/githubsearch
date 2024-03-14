import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class AuthInfo extends Equatable {
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "expires_in")
  final int expiresIn;
  @JsonKey(name: "refresh_token")
  final String refreshToken;
  @JsonKey(name: "refresh_token_expires_in")
  final int refreshTokenExpiresIn;
  @JsonKey(name: "scope")
  final String scope;
  @JsonKey(name: "token_type")
  final String tokenType;

  const AuthInfo({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.refreshTokenExpiresIn,
    required this.scope,
    required this.tokenType,
  });

  factory AuthInfo.fromJson(Map<String, dynamic> json) =>
      _$AuthInfoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthInfoToJson(this);

  @override
  List<Object?> get props => [
        accessToken,
        expiresIn,
        refreshToken,
        refreshTokenExpiresIn,
      ];
}
