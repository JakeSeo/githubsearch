import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class RefreshTokenRequestParamInfo extends Equatable {
  @JsonKey(name: "refresh_token")
  final String refreshToken;
  @JsonKey(name: "grant_type", includeToJson: true)
  final String grantType;
  @JsonKey(name: "client_id", includeToJson: true)
  final String clientId;
  @JsonKey(name: "client_secret", includeToJson: true)
  final String clientSecret;

  RefreshTokenRequestParamInfo({
    required this.refreshToken,
  })  : grantType = "refresh_token",
        clientId = dotenv.env['CLIENT_ID']!,
        clientSecret = dotenv.env['CLIENT_SECRET']!;

  factory RefreshTokenRequestParamInfo.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestParamInfoFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshTokenRequestParamInfoToJson(this);

  @override
  List<Object?> get props => [refreshToken];
}
