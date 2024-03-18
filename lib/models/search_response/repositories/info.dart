import 'package:json_annotation/json_annotation.dart';

import '../../github_repository/info.dart';
import '../info.dart';
part 'info.g.dart';

@JsonSerializable()
class SearchRepositoriesResponseInfo extends SearchResponseInfo {
  @JsonKey(name: "items")
  final List<GithubRepositoryInfo> repositories;
  SearchRepositoriesResponseInfo({
    required super.totalCount,
    required super.incompleteResults,
    this.repositories = const [],
  });

  factory SearchRepositoriesResponseInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchRepositoriesResponseInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SearchRepositoriesResponseInfoToJson(this);
}
