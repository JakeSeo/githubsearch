import 'package:json_annotation/json_annotation.dart';

import '../../github_code/info.dart';
import '../info.dart';

part 'info.g.dart';

@JsonSerializable()
class SearchCodeResponseInfo extends SearchResponseInfo {
  @JsonKey(name: "items")
  final List<GithubCodeInfo> codeList;
  SearchCodeResponseInfo({
    required super.totalCount,
    required super.incompleteResults,
    this.codeList = const [],
  });
  factory SearchCodeResponseInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchCodeResponseInfoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SearchCodeResponseInfoToJson(this);
}
