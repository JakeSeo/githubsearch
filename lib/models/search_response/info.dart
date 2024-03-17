import 'package:json_annotation/json_annotation.dart';

abstract class SearchResponseInfo {
  @JsonKey(name: "total_count")
  final int totalCount;
  @JsonKey(name: "incomplete_results")
  final bool incompleteResults;
  SearchResponseInfo({
    required this.totalCount,
    required this.incompleteResults,
  });

  Map<String, dynamic> toJson();
}
