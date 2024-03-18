import 'package:json_annotation/json_annotation.dart';

import '../github_user/info.dart';
import '../search_result_info.dart';
part 'info.g.dart';

@JsonSerializable()
class GithubRepositoryInfo extends SearchResultInfo {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "node_id")
  final String nodeId;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "full_name")
  final String fullName;
  @JsonKey(name: "license")
  final LicenseInfo? license;
  @JsonKey(name: "forks")
  final int forks;
  @JsonKey(name: "permissions")
  final PermissionsInfo permissions;
  @JsonKey(name: "owner")
  final GithubUserInfo? owner;
  @JsonKey(name: "private")
  final bool private;
  @JsonKey(name: "html_url")
  final String htmlUrl;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "fork")
  final bool fork;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "archive_url")
  final String archiveUrl;
  @JsonKey(name: "assignee_url")
  final String? assigneesUrl;
  @JsonKey(name: "blob_url")
  final String? blobsUrl;
  @JsonKey(name: "branches_url")
  final String branchesUrl;
  @JsonKey(name: "collaborators_url")
  final String collaboratorsUrl;
  @JsonKey(name: "comments_url")
  final String commentsUrl;
  @JsonKey(name: "commits_url")
  final String commitsUrl;
  @JsonKey(name: "compare_url")
  final String compareUrl;
  @JsonKey(name: "contents_url")
  final String contentsUrl;
  @JsonKey(name: "contributors_url")
  final String contributorsUrl;
  @JsonKey(name: "deployments_url")
  final String deploymentsUrl;
  @JsonKey(name: "downloads_url")
  final String downloadsUrl;
  @JsonKey(name: "events_url")
  final String eventsUrl;
  @JsonKey(name: "forks_url")
  final String forksUrl;
  @JsonKey(name: "git_commits_url")
  final String gitCommitsUrl;
  @JsonKey(name: "git_refs_url")
  final String gitRefsUrl;
  @JsonKey(name: "git_tags_url")
  final String gitTagsUrl;
  @JsonKey(name: "git_url")
  final String? gitUrl;
  @JsonKey(name: "issue_comment_url")
  final String? issueCommentUrl;
  @JsonKey(name: "issue_events_url")
  final String? issueEventsUrl;
  @JsonKey(name: "issues_url")
  final String? issuesUrl;
  @JsonKey(name: "keys_url")
  final String? keysUrl;
  @JsonKey(name: "labels_url")
  final String? labelsUrl;
  @JsonKey(name: "languages_url")
  final String? languagesUrl;
  @JsonKey(name: "merges_url")
  final String? mergesUrl;
  @JsonKey(name: "milestones_url")
  final String? milestonesUrl;
  @JsonKey(name: "notifications_url")
  final String? notificationsUrl;
  @JsonKey(name: "pulls_url")
  final String? pullsUrl;
  @JsonKey(name: "releases_url")
  final String? releasesUrl;
  @JsonKey(name: "ssh_url")
  final String? sshUrl;
  @JsonKey(name: "stargazers_url")
  final String? stargazersUrl;
  @JsonKey(name: "statuses_url")
  final String? statusesUrl;
  @JsonKey(name: "subscribers_url")
  final String? subscribersUrl;
  @JsonKey(name: "subscription_url")
  final String? subscriptionUrl;
  @JsonKey(name: "tags_url")
  final String? tagsUrl;
  @JsonKey(name: "teams_url")
  final String? teamsUrl;
  @JsonKey(name: "trees_url")
  final String? treesUrl;
  @JsonKey(name: "clone_url")
  final String? cloneUrl;
  @JsonKey(name: "mirror_url")
  final String? mirrorUrl;
  @JsonKey(name: "hooks_url")
  final String? hooksUrl;
  @JsonKey(name: "svn_url")
  final String? svnUrl;
  @JsonKey(name: "homepage")
  final String? homepage;
  @JsonKey(name: "language")
  final String? language;
  @JsonKey(name: "forks_count")
  final int forksCount;
  @JsonKey(name: "stargazers_count")
  final int stargazersCount;
  @JsonKey(name: "watchers_count")
  final int watchersCount;
  @JsonKey(name: "size")
  final int size;
  @JsonKey(name: "default_branch")
  final String? defaultBranch;
  @JsonKey(name: "open_issues_count")
  final int openIssuesCount;
  @JsonKey(name: "is_template")
  final bool isTemplate;
  @JsonKey(name: "topics")
  final List<String> topics;
  @JsonKey(name: "has_issues")
  final bool hasIssues;
  @JsonKey(name: "had_projects")
  final bool hasProjects;
  @JsonKey(name: "has_wiki")
  final bool hasWiki;
  @JsonKey(name: "has_pages")
  final bool hasPages;
  @JsonKey(name: "has_downloads")
  final bool hasDownloads;
  @JsonKey(name: "has_discussions")
  final bool hasDiscussions;
  @JsonKey(name: "archived")
  final bool archived;
  @JsonKey(name: "disabled")
  final bool disabled;
  @JsonKey(name: "visibility")
  final String visibility;
  @JsonKey(name: "pushed_at")
  final DateTime? pushedAt;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "allow_rebase_merge")
  final bool allowRebaseMerge;
  @JsonKey(name: "allow_squash_merge")
  final bool allowSquashMerge;
  @JsonKey(name: "allow_auto_merge")
  final bool allowAutoMerge;
  @JsonKey(name: "delete_branch_on_merge")
  final bool deleteBranchOnMerge;
  @JsonKey(name: "allow_update_branch")
  final bool allowUpdateBranch;
  @JsonKey(name: "use_squash_pr_title_as_default")
  final bool useSquashPrTitleAsDefault;
  @JsonKey(name: "squash_merge_commit_title")
  final String squashMergeCommitTitle;
  @JsonKey(name: "squash_merge_commit_message")
  final String squashMergeCommitMessage;
  @JsonKey(name: "merge_commit_title")
  final String mergeCommitTitle;
  @JsonKey(name: "merge_commit_message")
  final String mergeCommitMessage;
  @JsonKey(name: "allow_merge_commit")
  final bool allowMergeCommit;
  @JsonKey(name: "allow_forking")
  final bool allowForking;
  @JsonKey(name: "web_commit_signoff_required")
  final bool webCommitSignoffRequired;
  @JsonKey(name: "open_issues")
  final int openIssues;
  @JsonKey(name: "watchers")
  final int watchers;
  @JsonKey(name: "master_branch")
  final String masterBranch;
  @JsonKey(name: "starred_at")
  final DateTime? starredAt;
  @JsonKey(name: "anonymous_access_enabled")
  final bool anonymousAccessEnabled;

  GithubRepositoryInfo({
    required this.archiveUrl,
    required this.assigneesUrl,
    required this.blobsUrl,
    required this.branchesUrl,
    required this.collaboratorsUrl,
    required this.commentsUrl,
    required this.commitsUrl,
    required this.compareUrl,
    required this.contentsUrl,
    required this.contributorsUrl,
    required this.deploymentsUrl,
    required this.description,
    required this.downloadsUrl,
    required this.eventsUrl,
    required this.fork,
    required this.forksUrl,
    required this.fullName,
    required this.gitCommitsUrl,
    required this.gitRefsUrl,
    required this.gitTagsUrl,
    required this.hooksUrl,
    required this.htmlUrl,
    required this.id,
    required this.nodeId,
    required this.issueCommentUrl,
    required this.issueEventsUrl,
    required this.issuesUrl,
    required this.keysUrl,
    required this.labelsUrl,
    required this.languagesUrl,
    required this.mergesUrl,
    required this.milestonesUrl,
    required this.name,
    required this.notificationsUrl,
    required this.owner,
    required this.pullsUrl,
    required this.releasesUrl,
    required this.stargazersUrl,
    required this.statusesUrl,
    required this.subscribersUrl,
    required this.subscriptionUrl,
    required this.tagsUrl,
    required this.teamsUrl,
    required this.treesUrl,
    required this.url,
    required this.cloneUrl,
    required this.defaultBranch,
    this.forks = 0,
    this.forksCount = 0,
    required this.gitUrl,
    required this.homepage,
    required this.language,
    required this.mirrorUrl,
    this.openIssues = 0,
    this.openIssuesCount = 0,
    required this.license,
    required this.pushedAt,
    this.size = 0,
    required this.sshUrl,
    this.stargazersCount = 0,
    required this.svnUrl,
    this.watchers = 0,
    this.watchersCount = 0,
    required this.createdAt,
    required this.updatedAt,
    this.permissions = const PermissionsInfo(),
    this.topics = const [],
    this.squashMergeCommitTitle = "PR_TITLE",
    this.squashMergeCommitMessage = "PR_BODY",
    this.mergeCommitTitle = "PR_TITLE",
    this.mergeCommitMessage = "PR_BODY",
    this.masterBranch = "",
    this.starredAt,
    this.private = false,
    this.isTemplate = false,
    this.hasIssues = true,
    this.hasProjects = true,
    this.hasWiki = true,
    this.hasPages = false,
    this.hasDownloads = true,
    this.hasDiscussions = false,
    this.archived = false,
    this.disabled = false,
    this.visibility = "public",
    this.allowRebaseMerge = true,
    this.allowSquashMerge = true,
    this.allowAutoMerge = false,
    this.deleteBranchOnMerge = false,
    this.allowUpdateBranch = false,
    this.useSquashPrTitleAsDefault = false,
    this.allowMergeCommit = true,
    this.allowForking = false,
    this.webCommitSignoffRequired = false,
    this.anonymousAccessEnabled = false,
  });
  factory GithubRepositoryInfo.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryInfoFromJson(json);
  Map<String, dynamic> toJson() => _$GithubRepositoryInfoToJson(this);
}

@JsonSerializable()
class LicenseInfo {
  @JsonKey(name: "key")
  final String key;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "spdx_id")
  final String? spdxId;
  @JsonKey(name: "node_id")
  final String nodeId;
  @JsonKey(name: "html_url")
  final String? htmlUrl;

  LicenseInfo({
    required this.key,
    required this.name,
    this.url,
    this.spdxId,
    required this.nodeId,
    required this.htmlUrl,
  });
  factory LicenseInfo.fromJson(Map<String, dynamic> json) =>
      _$LicenseInfoFromJson(json);
  Map<String, dynamic> toJson() => _$LicenseInfoToJson(this);
}

@JsonSerializable()
class PermissionsInfo {
  @JsonKey(name: "admin")
  final bool admin;
  @JsonKey(name: "pull")
  final bool pull;
  @JsonKey(name: "triage")
  final bool triage;
  @JsonKey(name: "push")
  final bool push;
  @JsonKey(name: "maintain")
  final bool maintain;

  const PermissionsInfo({
    this.admin = false,
    this.pull = false,
    this.triage = false,
    this.push = false,
    this.maintain = false,
  });

  factory PermissionsInfo.fromJson(Map<String, dynamic> json) =>
      _$PermissionsInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PermissionsInfoToJson(this);
}
