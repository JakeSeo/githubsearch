import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class AuthRequestParamInfo extends Equatable {
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: "client_id", includeToJson: true)
  final String clientId;
  @JsonKey(name: "client_secret", includeToJson: true)
  final String clientSecret;

  AuthRequestParamInfo({
    required this.code,
  })  : clientId = dotenv.env['CLIENT_ID']!,
        clientSecret = dotenv.env['CLIENT_SECRET']!;

  factory AuthRequestParamInfo.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestParamInfoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthRequestParamInfoToJson(this);

  @override
  List<Object?> get props => [code];
}
