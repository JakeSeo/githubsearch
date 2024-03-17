import 'package:json_annotation/json_annotation.dart';
part 'info.g.dart';

@JsonSerializable()
class SearchRequestParamInfo {
  @JsonKey(name: "q")
  final String q;
  @JsonKey(name: "per_page")
  final int perPage;
  @JsonKey(name: "page")
  final int page;
  SearchRequestParamInfo({
    required this.q,
    this.perPage = 30,
    this.page = 1,
  });
  factory SearchRequestParamInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestParamInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SearchRequestParamInfoToJson(this);
}
