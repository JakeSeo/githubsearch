import 'package:json_annotation/json_annotation.dart';

import '../../github_issue/info.dart';
import '../info.dart';

part 'info.g.dart';

@JsonSerializable()
class SearchIssuesResponseInfo extends SearchResponseInfo {
  @JsonKey(name: "items")
  final List<GithubIssueInfo> issueList;
  SearchIssuesResponseInfo({
    required super.totalCount,
    required super.incompleteResults,
    this.issueList = const [],
  });

  factory SearchIssuesResponseInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchIssuesResponseInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SearchIssuesResponseInfoToJson(this);
}
