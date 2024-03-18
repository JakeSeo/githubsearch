import 'package:flutter/material.dart';
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

enum SearchType {
  code(
    icon: Icons.code,
    label: "코드",
    value: "code",
  ),
  repositories(
    icon: Icons.book,
    label: "리포지토리",
    value: "repositories",
  ),
  issues(
    icon: Icons.error_outline,
    label: "이슈",
    value: "issues",
  ),
  pullRequest(
    icon: Icons.subdirectory_arrow_left,
    label: "Pull Request",
    value: "pull_requests",
  ),
  users(
    icon: Icons.person,
    label: "사용자",
    value: "users",
  ),
  organizations(
    icon: Icons.business,
    label: "조직",
    value: "organizations",
  );

  final IconData icon;
  final String label, value;
  const SearchType({
    required this.icon,
    required this.label,
    required this.value,
  });
}
