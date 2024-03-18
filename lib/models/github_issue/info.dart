import 'package:json_annotation/json_annotation.dart';

import '../github_repository/info.dart';
import '../github_user/info.dart';
import '../search_result_info.dart';
part 'info.g.dart';

@JsonSerializable()
class GithubIssueInfo extends SearchResultInfo {
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "repository_url")
  final String repositoryUrl;
  @JsonKey(name: "labels_url")
  final String labelsUrl;
  @JsonKey(name: "comments_url")
  final String commentsUrl;
  @JsonKey(name: "events_url")
  final String eventsUrl;
  @JsonKey(name: "html_url")
  final String htmlUrl;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "node_id")
  final String nodeId;
  @JsonKey(name: "number")
  final int number;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "locked")
  final bool locked;
  @JsonKey(name: "active_lock_reason")
  final String? activeLockReason;
  @JsonKey(name: "user")
  final GithubUserInfo? user;
  @JsonKey(name: "labels")
  final List<LabelInfo> labels;
  @JsonKey(name: "state")
  final String state;
  @JsonKey(name: "state_reason")
  final String? stateReason;
  @JsonKey(name: "assignee")
  final GithubUserInfo? assignee;
  @JsonKey(name: "assignees")
  final List<GithubUserInfo> assignees;
  @JsonKey(name: "milestone")
  final MilestoneInfo? milestone;
  @JsonKey(name: "comments")
  final int comments;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "closed_at")
  final DateTime? closedAt;
  @JsonKey(name: "text_matches")
  final List<TextMatchInfo> textMatches;
  @JsonKey(name: "pull_request")
  final PullRequestInfo? pullRequest;
  @JsonKey(name: "body")
  final String body;
  @JsonKey(name: "score")
  final double score;
  @JsonKey(name: "author_association")
  final AuthorAssociation authorAssociation;
  @JsonKey(name: "draft")
  final bool draft;
  @JsonKey(name: "repository")
  final GithubRepositoryInfo? repository;
  @JsonKey(name: "body_html")
  final String bodyHtml;
  @JsonKey(name: "body_text")
  final String bodyText;
  @JsonKey(name: "timeline_url")
  final String timelineUrl;
  @JsonKey(name: "performed_via_github_app")
  final GithubAppInfo? performedViaGithubApp;
  @JsonKey(name: "reactions")
  final ReactionsInfo? reactions;

  GithubIssueInfo({
    required this.assignee,
    required this.closedAt,
    required this.comments,
    required this.commentsUrl,
    required this.eventsUrl,
    required this.id,
    required this.nodeId,
    required this.labels,
    required this.labelsUrl,
    required this.milestone,
    required this.number,
    required this.repositoryUrl,
    required this.state,
    required this.locked,
    required this.title,
    required this.url,
    required this.user,
    required this.authorAssociation,
    required this.createdAt,
    required this.updatedAt,
    required this.score,
    this.htmlUrl = "",
    this.activeLockReason,
    this.stateReason,
    this.assignees = const [],
    this.textMatches = const [],
    this.pullRequest,
    this.body = "",
    this.draft = false,
    this.repository,
    this.bodyHtml = "",
    this.bodyText = "",
    this.timelineUrl = "",
    this.performedViaGithubApp,
    this.reactions,
  });
  factory GithubIssueInfo.fromJson(Map<String, dynamic> json) =>
      _$GithubIssueInfoFromJson(json);
  Map<String, dynamic> toJson() => _$GithubIssueInfoToJson(this);
}

enum AuthorAssociation {
  @JsonValue("COLLABORATOR")
  collaborator,
  @JsonValue("CONTRIBUTOR")
  contributor,
  @JsonValue("FIRST_TIMER")
  firstTimer,
  @JsonValue("FIRST_TIME_CONTRIBUTOR")
  firstTimeContributor,
  @JsonValue("MANNEQUIN")
  mannequin,
  @JsonValue("MEMBER")
  member,
  @JsonValue("NONE")
  none,
  @JsonValue("OWNER")
  owner;
}

@JsonSerializable()
class LabelInfo {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "node_id")
  final String nodeId;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "color")
  final String color;
  @JsonKey(name: "default")
  final bool isDefault;
  @JsonKey(name: "description")
  final String? description;
  LabelInfo({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.name,
    required this.color,
    this.isDefault = false,
    this.description,
  });
  factory LabelInfo.fromJson(Map<String, dynamic> json) =>
      _$LabelInfoFromJson(json);
  Map<String, dynamic> toJson() => _$LabelInfoToJson(this);
}

@JsonSerializable()
class MilestoneInfo {
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "html_url")
  final String htmlUrl;
  @JsonKey(name: "labels_url")
  final String labelsUrl;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "node_id")
  final String nodeId;
  @JsonKey(name: "number")
  final int number;
  @JsonKey(name: "state")
  final MilestoneState state;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "creator")
  final GithubUserInfo? creator;
  @JsonKey(name: "open_issues")
  final int openIssues;
  @JsonKey(name: "closed_issues")
  final int closedIssues;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "closed_at")
  final DateTime? closedAt;
  @JsonKey(name: "due_on")
  final DateTime? dueOn;

  MilestoneInfo({
    required this.closedIssues,
    required this.creator,
    required this.description,
    required this.dueOn,
    required this.closedAt,
    required this.id,
    required this.nodeId,
    required this.labelsUrl,
    required this.htmlUrl,
    required this.number,
    required this.openIssues,
    required this.state,
    required this.title,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MilestoneInfo.fromJson(Map<String, dynamic> json) =>
      _$MilestoneInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MilestoneInfoToJson(this);
}

enum MilestoneState {
  @JsonValue("open")
  open,
  @JsonValue("closed")
  closed;
}

@JsonSerializable()
class TextMatchInfo {
  @JsonKey(name: "object_url")
  final String objectUrl;
  @JsonKey(name: "object_type")
  final String? objectType;
  @JsonKey(name: "property")
  final String property;
  @JsonKey(name: "fragment")
  final String fragment;
  @JsonKey(name: "matches")
  final List<MatchInfo> matches;
  TextMatchInfo({
    required this.objectUrl,
    this.objectType,
    required this.property,
    required this.fragment,
    this.matches = const [],
  });
  factory TextMatchInfo.fromJson(Map<String, dynamic> json) =>
      _$TextMatchInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TextMatchInfoToJson(this);
}

@JsonSerializable()
class MatchInfo {
  @JsonKey(name: "text")
  final String text;
  @JsonKey(name: "indices")
  final List<int> indices;
  MatchInfo({
    required this.text,
    this.indices = const [],
  });
  factory MatchInfo.fromJson(Map<String, dynamic> json) =>
      _$MatchInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MatchInfoToJson(this);
}

@JsonSerializable()
class PullRequestInfo {
  @JsonKey(name: "merged_at")
  final DateTime? mergedAt;
  @JsonKey(name: "diff_Url")
  final String? diffUrl;
  @JsonKey(name: "html_url")
  final String? htmlUrl;
  @JsonKey(name: "patch_url")
  final String? patchUrl;
  @JsonKey(name: "url")
  final String? url;
  const PullRequestInfo({
    this.mergedAt,
    this.diffUrl,
    this.htmlUrl,
    this.patchUrl,
    this.url,
  });
  factory PullRequestInfo.fromJson(Map<String, dynamic> json) =>
      _$PullRequestInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PullRequestInfoToJson(this);
}

@JsonSerializable()
class GithubAppInfo {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "slug")
  final String slug;
  @JsonKey(name: "node_id")
  final String nodeId;
  @JsonKey(name: "owner")
  final GithubUserInfo? owner;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "desription")
  final String? description;
  @JsonKey(name: "external_url")
  final String externalUrl;
  @JsonKey(name: "html_url")
  final String htmlUrl;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "permissions")
  final PermissionsInfo permissions;
  @JsonKey(name: "events")
  final List<String> events;
  @JsonKey(name: "installations_count")
  final int installationsCount;
  @JsonKey(name: "client_id")
  final String clientId;
  @JsonKey(name: "client_secret")
  final String clientSecret;
  @JsonKey(name: "webhook_secret")
  final String? webhookSecret;
  @JsonKey(name: "pem")
  final String pem;

  GithubAppInfo({
    required this.id,
    required this.nodeId,
    required this.owner,
    required this.name,
    required this.description,
    required this.externalUrl,
    required this.htmlUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.permissions,
    required this.events,
    this.slug = "",
    this.installationsCount = 0,
    this.clientId = "",
    this.clientSecret = "",
    this.webhookSecret,
    this.pem = "",
  });
  factory GithubAppInfo.fromJson(Map<String, dynamic> json) =>
      _$GithubAppInfoFromJson(json);
  Map<String, dynamic> toJson() => _$GithubAppInfoToJson(this);
}

@JsonSerializable()
class ReactionsInfo {
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "total_count")
  final int totalCount;
  @JsonKey(name: "+1")
  final int plus1;
  @JsonKey(name: "-1")
  final int minus1;
  @JsonKey(name: "laugh")
  final int laugh;
  @JsonKey(name: "confused")
  final int confused;
  @JsonKey(name: "heart")
  final int heart;
  @JsonKey(name: "hooray")
  final int hooray;
  @JsonKey(name: "eyes")
  final int eyes;
  @JsonKey(name: "rocket")
  final int rocket;
  const ReactionsInfo({
    this.url = "",
    this.totalCount = 0,
    this.plus1 = 0,
    this.minus1 = 0,
    this.laugh = 0,
    this.confused = 0,
    this.heart = 0,
    this.hooray = 0,
    this.eyes = 0,
    this.rocket = 0,
  });
  factory ReactionsInfo.fromJson(Map<String, dynamic> json) =>
      _$ReactionsInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ReactionsInfoToJson(this);
}
//     {
//       "url": "https://api.github.com/repos/batterseapower/pinyin-toolkit/issues/132",
//       "repository_url": "https://api.github.com/repos/batterseapower/pinyin-toolkit",
//       "labels_url": "https://api.github.com/repos/batterseapower/pinyin-toolkit/issues/132/labels{/name}",
//       "comments_url": "https://api.github.com/repos/batterseapower/pinyin-toolkit/issues/132/comments",
//       "events_url": "https://api.github.com/repos/batterseapower/pinyin-toolkit/issues/132/events",
//       "html_url": "https://github.com/batterseapower/pinyin-toolkit/issues/132",
//       "id": 35802,
//       "node_id": "MDU6SXNzdWUzNTgwMg==",
//       "number": 132,
//       "title": "Line Number Indexes Beyond 20 Not Displayed",
//       "user": {
//         "login": "Nick3C",
//         "id": 90254,
//         "node_id": "MDQ6VXNlcjkwMjU0",
//         "avatar_url": "https://secure.gravatar.com/avatar/934442aadfe3b2f4630510de416c5718?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
//         "gravatar_id": "",
//         "url": "https://api.github.com/users/Nick3C",
//         "html_url": "https://github.com/Nick3C",
//         "followers_url": "https://api.github.com/users/Nick3C/followers",
//         "following_url": "https://api.github.com/users/Nick3C/following{/other_user}",
//         "gists_url": "https://api.github.com/users/Nick3C/gists{/gist_id}",
//         "starred_url": "https://api.github.com/users/Nick3C/starred{/owner}{/repo}",
//         "subscriptions_url": "https://api.github.com/users/Nick3C/subscriptions",
//         "organizations_url": "https://api.github.com/users/Nick3C/orgs",
//         "repos_url": "https://api.github.com/users/Nick3C/repos",
//         "events_url": "https://api.github.com/users/Nick3C/events{/privacy}",
//         "received_events_url": "https://api.github.com/users/Nick3C/received_events",
//         "type": "User",
//         "site_admin": true
//       },
//       "labels": [
//         {
//           "id": 4,
//           "node_id": "MDU6TGFiZWw0",
//           "url": "https://api.github.com/repos/batterseapower/pinyin-toolkit/labels/bug",
//           "name": "bug",
//           "color": "ff0000"
//         }
//       ],
//       "state": "open",
//       "assignee": null,
//       "milestone": {
//         "url": "https://api.github.com/repos/octocat/Hello-World/milestones/1",
//         "html_url": "https://github.com/octocat/Hello-World/milestones/v1.0",
//         "labels_url": "https://api.github.com/repos/octocat/Hello-World/milestones/1/labels",
//         "id": 1002604,
//         "node_id": "MDk6TWlsZXN0b25lMTAwMjYwNA==",
//         "number": 1,
//         "state": "open",
//         "title": "v1.0",
//         "description": "Tracking milestone for version 1.0",
//         "creator": {
//           "login": "octocat",
//           "id": 1,
//           "node_id": "MDQ6VXNlcjE=",
//           "avatar_url": "https://github.com/images/error/octocat_happy.gif",
//           "gravatar_id": "",
//           "url": "https://api.github.com/users/octocat",
//           "html_url": "https://github.com/octocat",
//           "followers_url": "https://api.github.com/users/octocat/followers",
//           "following_url": "https://api.github.com/users/octocat/following{/other_user}",
//           "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
//           "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
//           "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
//           "organizations_url": "https://api.github.com/users/octocat/orgs",
//           "repos_url": "https://api.github.com/users/octocat/repos",
//           "events_url": "https://api.github.com/users/octocat/events{/privacy}",
//           "received_events_url": "https://api.github.com/users/octocat/received_events",
//           "type": "User",
//           "site_admin": false
//         },
//         "open_issues": 4,
//         "closed_issues": 8,
//         "created_at": "2011-04-10T20:09:31Z",
//         "updated_at": "2014-03-03T18:58:10Z",
//         "closed_at": "2013-02-12T13:22:01Z",
//         "due_on": "2012-10-09T23:39:01Z"
//       },
//       "comments": 15,
//       "created_at": "2009-07-12T20:10:41Z",
//       "updated_at": "2009-07-19T09:23:43Z",
//       "closed_at": null,
//       "pull_request": {
//         "url": "https://api/github.com/repos/octocat/Hello-World/pull/1347",
//         "html_url": "https://github.com/octocat/Hello-World/pull/1347",
//         "diff_url": "https://github.com/octocat/Hello-World/pull/1347.diff",
//         "patch_url": "https://api.github.com/repos/octocat/Hello-World/pulls/1347"
//       },
//       "body": "...",
//       "score": 1,
//       "locked": true,
//       "author_association": "COLLABORATOR",
//       "state_reason": "completed"
//     }

// {
//   "type": "object",
//   "required": [
//     "total_count",
//     "incomplete_results",
//     "items"
//   ],
//   "properties": {
//     "total_count": {
//       "type": "integer"
//     },
//     "incomplete_results": {
//       "type": "boolean"
//     },
//     "items": {
//       "type": "array",
//       "items": {
//         "title": "Issue Search Result Item",
//         "description": "Issue Search Result Item",
//         "type": "object",
//         "properties": {
//           "url": {
//             "type": "string",
//             "format": "uri"
//           },
//           "repository_url": {
//             "type": "string",
//             "format": "uri"
//           },
//           "labels_url": {
//             "type": "string"
//           },
//           "comments_url": {
//             "type": "string",
//             "format": "uri"
//           },
//           "events_url": {
//             "type": "string",
//             "format": "uri"
//           },
//           "html_url": {
//             "type": "string",
//             "format": "uri"
//           },
//           "id": {
//             "type": "integer",
//             "format": "int64"
//           },
//           "node_id": {
//             "type": "string"
//           },
//           "number": {
//             "type": "integer"
//           },
//           "title": {
//             "type": "string"
//           },
//           "locked": {
//             "type": "boolean"
//           },
//           "active_lock_reason": {
//             "type": [
//               "string",
//               "null"
//             ]
//           },
//           "assignees": {
//             "type": [
//               "array",
//               "null"
//             ],
//             "items": {
//               "title": "Simple User",
//               "description": "A GitHub user.",
//               "type": "object",
//               "properties": {
//                 "name": {
//                   "type": [
//                     "string",
//                     "null"
//                   ]
//                 },
//                 "email": {
//                   "type": [
//                     "string",
//                     "null"
//                   ]
//                 },
//                 "login": {
//                   "type": "string",
//                   "examples": [
//                     "octocat"
//                   ]
//                 },
//                 "id": {
//                   "type": "integer",
//                   "examples": [
//                     1
//                   ]
//                 },
//                 "node_id": {
//                   "type": "string",
//                   "examples": [
//                     "MDQ6VXNlcjE="
//                   ]
//                 },
//                 "avatar_url": {
//                   "type": "string",
//                   "format": "uri",
//                   "examples": [
//                     "https://github.com/images/error/octocat_happy.gif"
//                   ]
//                 },
//                 "gravatar_id": {
//                   "type": [
//                     "string",
//                     "null"
//                   ],
//                   "examples": [
//                     "41d064eb2195891e12d0413f63227ea7"
//                   ]
//                 },
//                 "url": {
//                   "type": "string",
//                   "format": "uri",
//                   "examples": [
//                     "https://api.github.com/users/octocat"
//                   ]
//                 },
//                 "html_url": {
//                   "type": "string",
//                   "format": "uri",
//                   "examples": [
//                     "https://github.com/octocat"
//                   ]
//                 },
//                 "followers_url": {
//                   "type": "string",
//                   "format": "uri",
//                   "examples": [
//                     "https://api.github.com/users/octocat/followers"
//                   ]
//                 },
//                 "following_url": {
//                   "type": "string",
//                   "examples": [
//                     "https://api.github.com/users/octocat/following{/other_user}"
//                   ]
//                 },
//                 "gists_url": {
//                   "type": "string",
//                   "examples": [
//                     "https://api.github.com/users/octocat/gists{/gist_id}"
//                   ]
//                 },
//                 "starred_url": {
//                   "type": "string",
//                   "examples": [
//                     "https://api.github.com/users/octocat/starred{/owner}{/repo}"
//                   ]
//                 },
//                 "subscriptions_url": {
//                   "type": "string",
//                   "format": "uri",
//                   "examples": [
//                     "https://api.github.com/users/octocat/subscriptions"
//                   ]
//                 },
//                 "organizations_url": {
//                   "type": "string",
//                   "format": "uri",
//                   "examples": [
//                     "https://api.github.com/users/octocat/orgs"
//                   ]
//                 },
//                 "repos_url": {
//                   "type": "string",
//                   "format": "uri",
//                   "examples": [
//                     "https://api.github.com/users/octocat/repos"
//                   ]
//                 },
//                 "events_url": {
//                   "type": "string",
//                   "examples": [
//                     "https://api.github.com/users/octocat/events{/privacy}"
//                   ]
//                 },
//                 "received_events_url": {
//                   "type": "string",
//                   "format": "uri",
//                   "examples": [
//                     "https://api.github.com/users/octocat/received_events"
//                   ]
//                 },
//                 "type": {
//                   "type": "string",
//                   "examples": [
//                     "User"
//                   ]
//                 },
//                 "site_admin": {
//                   "type": "boolean"
//                 },
//                 "starred_at": {
//                   "type": "string",
//                   "examples": [
//                     "\"2020-07-09T00:17:55Z\""
//                   ]
//                 }
//               },
//               "required": [
//                 "avatar_url",
//                 "events_url",
//                 "followers_url",
//                 "following_url",
//                 "gists_url",
//                 "gravatar_id",
//                 "html_url",
//                 "id",
//                 "node_id",
//                 "login",
//                 "organizations_url",
//                 "received_events_url",
//                 "repos_url",
//                 "site_admin",
//                 "starred_url",
//                 "subscriptions_url",
//                 "type",
//                 "url"
//               ]
//             }
//           },
//           "user": {
//             "anyOf": [
//               {
//                 "type": "null"
//               },
//               {
//                 "title": "Simple User",
//                 "description": "A GitHub user.",
//                 "type": "object",
//                 "properties": {
//                   "name": {
//                     "type": [
//                       "string",
//                       "null"
//                     ]
//                   },
//                   "email": {
//                     "type": [
//                       "string",
//                       "null"
//                     ]
//                   },
//                   "login": {
//                     "type": "string",
//                     "examples": [
//                       "octocat"
//                     ]
//                   },
//                   "id": {
//                     "type": "integer",
//                     "examples": [
//                       1
//                     ]
//                   },
//                   "node_id": {
//                     "type": "string",
//                     "examples": [
//                       "MDQ6VXNlcjE="
//                     ]
//                   },
//                   "avatar_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://github.com/images/error/octocat_happy.gif"
//                     ]
//                   },
//                   "gravatar_id": {
//                     "type": [
//                       "string",
//                       "null"
//                     ],
//                     "examples": [
//                       "41d064eb2195891e12d0413f63227ea7"
//                     ]
//                   },
//                   "url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat"
//                     ]
//                   },
//                   "html_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://github.com/octocat"
//                     ]
//                   },
//                   "followers_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat/followers"
//                     ]
//                   },
//                   "following_url": {
//                     "type": "string",
//                     "examples": [
//                       "https://api.github.com/users/octocat/following{/other_user}"
//                     ]
//                   },
//                   "gists_url": {
//                     "type": "string",
//                     "examples": [
//                       "https://api.github.com/users/octocat/gists{/gist_id}"
//                     ]
//                   },
//                   "starred_url": {
//                     "type": "string",
//                     "examples": [
//                       "https://api.github.com/users/octocat/starred{/owner}{/repo}"
//                     ]
//                   },
//                   "subscriptions_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat/subscriptions"
//                     ]
//                   },
//                   "organizations_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat/orgs"
//                     ]
//                   },
//                   "repos_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat/repos"
//                     ]
//                   },
//                   "events_url": {
//                     "type": "string",
//                     "examples": [
//                       "https://api.github.com/users/octocat/events{/privacy}"
//                     ]
//                   },
//                   "received_events_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat/received_events"
//                     ]
//                   },
//                   "type": {
//                     "type": "string",
//                     "examples": [
//                       "User"
//                     ]
//                   },
//                   "site_admin": {
//                     "type": "boolean"
//                   },
//                   "starred_at": {
//                     "type": "string",
//                     "examples": [
//                       "\"2020-07-09T00:17:55Z\""
//                     ]
//                   }
//                 },
//                 "required": [
//                   "avatar_url",
//                   "events_url",
//                   "followers_url",
//                   "following_url",
//                   "gists_url",
//                   "gravatar_id",
//                   "html_url",
//                   "id",
//                   "node_id",
//                   "login",
//                   "organizations_url",
//                   "received_events_url",
//                   "repos_url",
//                   "site_admin",
//                   "starred_url",
//                   "subscriptions_url",
//                   "type",
//                   "url"
//                 ]
//               }
//             ]
//           },
//           "labels": {
//             "type": "array",
//             "items": {
//               "type": "object",
//               "properties": {
//                 "id": {
//                   "type": "integer",
//                   "format": "int64"
//                 },
//                 "node_id": {
//                   "type": "string"
//                 },
//                 "url": {
//                   "type": "string"
//                 },
//                 "name": {
//                   "type": "string"
//                 },
//                 "color": {
//                   "type": "string"
//                 },
//                 "default": {
//                   "type": "boolean"
//                 },
//                 "description": {
//                   "type": [
//                     "string",
//                     "null"
//                   ]
//                 }
//               }
//             }
//           },
//           "state": {
//             "type": "string"
//           },
//           "state_reason": {
//             "type": [
//               "string",
//               "null"
//             ]
//           },
//           "assignee": {
//             "anyOf": [
//               {
//                 "type": "null"
//               },
//               {
//                 "title": "Simple User",
//                 "description": "A GitHub user.",
//                 "type": "object",
//                 "properties": {
//                   "name": {
//                     "type": [
//                       "string",
//                       "null"
//                     ]
//                   },
//                   "email": {
//                     "type": [
//                       "string",
//                       "null"
//                     ]
//                   },
//                   "login": {
//                     "type": "string",
//                     "examples": [
//                       "octocat"
//                     ]
//                   },
//                   "id": {
//                     "type": "integer",
//                     "examples": [
//                       1
//                     ]
//                   },
//                   "node_id": {
//                     "type": "string",
//                     "examples": [
//                       "MDQ6VXNlcjE="
//                     ]
//                   },
//                   "avatar_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://github.com/images/error/octocat_happy.gif"
//                     ]
//                   },
//                   "gravatar_id": {
//                     "type": [
//                       "string",
//                       "null"
//                     ],
//                     "examples": [
//                       "41d064eb2195891e12d0413f63227ea7"
//                     ]
//                   },
//                   "url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat"
//                     ]
//                   },
//                   "html_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://github.com/octocat"
//                     ]
//                   },
//                   "followers_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat/followers"
//                     ]
//                   },
//                   "following_url": {
//                     "type": "string",
//                     "examples": [
//                       "https://api.github.com/users/octocat/following{/other_user}"
//                     ]
//                   },
//                   "gists_url": {
//                     "type": "string",
//                     "examples": [
//                       "https://api.github.com/users/octocat/gists{/gist_id}"
//                     ]
//                   },
//                   "starred_url": {
//                     "type": "string",
//                     "examples": [
//                       "https://api.github.com/users/octocat/starred{/owner}{/repo}"
//                     ]
//                   },
//                   "subscriptions_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat/subscriptions"
//                     ]
//                   },
//                   "organizations_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat/orgs"
//                     ]
//                   },
//                   "repos_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat/repos"
//                     ]
//                   },
//                   "events_url": {
//                     "type": "string",
//                     "examples": [
//                       "https://api.github.com/users/octocat/events{/privacy}"
//                     ]
//                   },
//                   "received_events_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat/received_events"
//                     ]
//                   },
//                   "type": {
//                     "type": "string",
//                     "examples": [
//                       "User"
//                     ]
//                   },
//                   "site_admin": {
//                     "type": "boolean"
//                   },
//                   "starred_at": {
//                     "type": "string",
//                     "examples": [
//                       "\"2020-07-09T00:17:55Z\""
//                     ]
//                   }
//                 },
//                 "required": [
//                   "avatar_url",
//                   "events_url",
//                   "followers_url",
//                   "following_url",
//                   "gists_url",
//                   "gravatar_id",
//                   "html_url",
//                   "id",
//                   "node_id",
//                   "login",
//                   "organizations_url",
//                   "received_events_url",
//                   "repos_url",
//                   "site_admin",
//                   "starred_url",
//                   "subscriptions_url",
//                   "type",
//                   "url"
//                 ]
//               }
//             ]
//           },
//           "milestone": {
//             "anyOf": [
//               {
//                 "type": "null"
//               },
//               {
//                 "title": "Milestone",
//                 "description": "A collection of related issues and pull requests.",
//                 "type": "object",
//                 "properties": {
//                   "url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/repos/octocat/Hello-World/milestones/1"
//                     ]
//                   },
//                   "html_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://github.com/octocat/Hello-World/milestones/v1.0"
//                     ]
//                   },
//                   "labels_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/repos/octocat/Hello-World/milestones/1/labels"
//                     ]
//                   },
//                   "id": {
//                     "type": "integer",
//                     "examples": [
//                       1002604
//                     ]
//                   },
//                   "node_id": {
//                     "type": "string",
//                     "examples": [
//                       "MDk6TWlsZXN0b25lMTAwMjYwNA=="
//                     ]
//                   },
//                   "number": {
//                     "description": "The number of the milestone.",
//                     "type": "integer",
//                     "examples": [
//                       42
//                     ]
//                   },
//                   "state": {
//                     "description": "The state of the milestone.",
//                     "type": "string",
//                     "enum": [
//                       "open",
//                       "closed"
//                     ],
//                     "default": "open",
//                     "examples": [
//                       "open"
//                     ]
//                   },
//                   "title": {
//                     "description": "The title of the milestone.",
//                     "type": "string",
//                     "examples": [
//                       "v1.0"
//                     ]
//                   },
//                   "description": {
//                     "type": [
//                       "string",
//                       "null"
//                     ],
//                     "examples": [
//                       "Tracking milestone for version 1.0"
//                     ]
//                   },
//                   "creator": {
//                     "anyOf": [
//                       {
//                         "type": "null"
//                       },
//                       {
//                         "title": "Simple User",
//                         "description": "A GitHub user.",
//                         "type": "object",
//                         "properties": {
//                           "name": {
//                             "type": [
//                               "string",
//                               "null"
//                             ]
//                           },
//                           "email": {
//                             "type": [
//                               "string",
//                               "null"
//                             ]
//                           },
//                           "login": {
//                             "type": "string",
//                             "examples": [
//                               "octocat"
//                             ]
//                           },
//                           "id": {
//                             "type": "integer",
//                             "examples": [
//                               1
//                             ]
//                           },
//                           "node_id": {
//                             "type": "string",
//                             "examples": [
//                               "MDQ6VXNlcjE="
//                             ]
//                           },
//                           "avatar_url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://github.com/images/error/octocat_happy.gif"
//                             ]
//                           },
//                           "gravatar_id": {
//                             "type": [
//                               "string",
//                               "null"
//                             ],
//                             "examples": [
//                               "41d064eb2195891e12d0413f63227ea7"
//                             ]
//                           },
//                           "url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://api.github.com/users/octocat"
//                             ]
//                           },
//                           "html_url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://github.com/octocat"
//                             ]
//                           },
//                           "followers_url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://api.github.com/users/octocat/followers"
//                             ]
//                           },
//                           "following_url": {
//                             "type": "string",
//                             "examples": [
//                               "https://api.github.com/users/octocat/following{/other_user}"
//                             ]
//                           },
//                           "gists_url": {
//                             "type": "string",
//                             "examples": [
//                               "https://api.github.com/users/octocat/gists{/gist_id}"
//                             ]
//                           },
//                           "starred_url": {
//                             "type": "string",
//                             "examples": [
//                               "https://api.github.com/users/octocat/starred{/owner}{/repo}"
//                             ]
//                           },
//                           "subscriptions_url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://api.github.com/users/octocat/subscriptions"
//                             ]
//                           },
//                           "organizations_url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://api.github.com/users/octocat/orgs"
//                             ]
//                           },
//                           "repos_url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://api.github.com/users/octocat/repos"
//                             ]
//                           },
//                           "events_url": {
//                             "type": "string",
//                             "examples": [
//                               "https://api.github.com/users/octocat/events{/privacy}"
//                             ]
//                           },
//                           "received_events_url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://api.github.com/users/octocat/received_events"
//                             ]
//                           },
//                           "type": {
//                             "type": "string",
//                             "examples": [
//                               "User"
//                             ]
//                           },
//                           "site_admin": {
//                             "type": "boolean"
//                           },
//                           "starred_at": {
//                             "type": "string",
//                             "examples": [
//                               "\"2020-07-09T00:17:55Z\""
//                             ]
//                           }
//                         },
//                         "required": [
//                           "avatar_url",
//                           "events_url",
//                           "followers_url",
//                           "following_url",
//                           "gists_url",
//                           "gravatar_id",
//                           "html_url",
//                           "id",
//                           "node_id",
//                           "login",
//                           "organizations_url",
//                           "received_events_url",
//                           "repos_url",
//                           "site_admin",
//                           "starred_url",
//                           "subscriptions_url",
//                           "type",
//                           "url"
//                         ]
//                       }
//                     ]
//                   },
//                   "open_issues": {
//                     "type": "integer",
//                     "examples": [
//                       4
//                     ]
//                   },
//                   "closed_issues": {
//                     "type": "integer",
//                     "examples": [
//                       8
//                     ]
//                   },
//                   "created_at": {
//                     "type": "string",
//                     "format": "date-time",
//                     "examples": [
//                       "2011-04-10T20:09:31Z"
//                     ]
//                   },
//                   "updated_at": {
//                     "type": "string",
//                     "format": "date-time",
//                     "examples": [
//                       "2014-03-03T18:58:10Z"
//                     ]
//                   },
//                   "closed_at": {
//                     "type": [
//                       "string",
//                       "null"
//                     ],
//                     "format": "date-time",
//                     "examples": [
//                       "2013-02-12T13:22:01Z"
//                     ]
//                   },
//                   "due_on": {
//                     "type": [
//                       "string",
//                       "null"
//                     ],
//                     "format": "date-time",
//                     "examples": [
//                       "2012-10-09T23:39:01Z"
//                     ]
//                   }
//                 },
//                 "required": [
//                   "closed_issues",
//                   "creator",
//                   "description",
//                   "due_on",
//                   "closed_at",
//                   "id",
//                   "node_id",
//                   "labels_url",
//                   "html_url",
//                   "number",
//                   "open_issues",
//                   "state",
//                   "title",
//                   "url",
//                   "created_at",
//                   "updated_at"
//                 ]
//               }
//             ]
//           },
//           "comments": {
//             "type": "integer"
//           },
//           "created_at": {
//             "type": "string",
//             "format": "date-time"
//           },
//           "updated_at": {
//             "type": "string",
//             "format": "date-time"
//           },
//           "closed_at": {
//             "type": [
//               "string",
//               "null"
//             ],
//             "format": "date-time"
//           },
//           "text_matches": {
//             "title": "Search Result Text Matches",
//             "type": "array",
//             "items": {
//               "type": "object",
//               "properties": {
//                 "object_url": {
//                   "type": "string"
//                 },
//                 "object_type": {
//                   "type": [
//                     "string",
//                     "null"
//                   ]
//                 },
//                 "property": {
//                   "type": "string"
//                 },
//                 "fragment": {
//                   "type": "string"
//                 },
//                 "matches": {
//                   "type": "array",
//                   "items": {
//                     "type": "object",
//                     "properties": {
//                       "text": {
//                         "type": "string"
//                       },
//                       "indices": {
//                         "type": "array",
//                         "items": {
//                           "type": "integer"
//                         }
//                       }
//                     }
//                   }
//                 }
//               }
//             }
//           },
//           "pull_request": {
//             "type": "object",
//             "properties": {
//               "merged_at": {
//                 "type": [
//                   "string",
//                   "null"
//                 ],
//                 "format": "date-time"
//               },
//               "diff_url": {
//                 "type": [
//                   "string",
//                   "null"
//                 ],
//                 "format": "uri"
//               },
//               "html_url": {
//                 "type": [
//                   "string",
//                   "null"
//                 ],
//                 "format": "uri"
//               },
//               "patch_url": {
//                 "type": [
//                   "string",
//                   "null"
//                 ],
//                 "format": "uri"
//               },
//               "url": {
//                 "type": [
//                   "string",
//                   "null"
//                 ],
//                 "format": "uri"
//               }
//             },
//             "required": [
//               "diff_url",
//               "html_url",
//               "patch_url",
//               "url"
//             ]
//           },
//           "body": {
//             "type": "string"
//           },
//           "score": {
//             "type": "number"
//           },
//           "author_association": {
//             "title": "author_association",
//             "type": "string",
//             "description": "How the author is associated with the repository.",
//             "enum": [
//               "COLLABORATOR",
//               "CONTRIBUTOR",
//               "FIRST_TIMER",
//               "FIRST_TIME_CONTRIBUTOR",
//               "MANNEQUIN",
//               "MEMBER",
//               "NONE",
//               "OWNER"
//             ],
//             "examples": [
//               "OWNER"
//             ]
//           },
//           "draft": {
//             "type": "boolean"
//           },
//           "repository": {
//             "title": "Repository",
//             "description": "A repository on GitHub.",
//             "type": "object",
//             "properties": {
//               "id": {
//                 "description": "Unique identifier of the repository",
//                 "type": "integer",
//                 "examples": [
//                   42
//                 ]
//               },
//               "node_id": {
//                 "type": "string",
//                 "examples": [
//                   "MDEwOlJlcG9zaXRvcnkxMjk2MjY5"
//                 ]
//               },
//               "name": {
//                 "description": "The name of the repository.",
//                 "type": "string",
//                 "examples": [
//                   "Team Environment"
//                 ]
//               },
//               "full_name": {
//                 "type": "string",
//                 "examples": [
//                   "octocat/Hello-World"
//                 ]
//               },
//               "license": {
//                 "anyOf": [
//                   {
//                     "type": "null"
//                   },
//                   {
//                     "title": "License Simple",
//                     "description": "License Simple",
//                     "type": "object",
//                     "properties": {
//                       "key": {
//                         "type": "string",
//                         "examples": [
//                           "mit"
//                         ]
//                       },
//                       "name": {
//                         "type": "string",
//                         "examples": [
//                           "MIT License"
//                         ]
//                       },
//                       "url": {
//                         "type": [
//                           "string",
//                           "null"
//                         ],
//                         "format": "uri",
//                         "examples": [
//                           "https://api.github.com/licenses/mit"
//                         ]
//                       },
//                       "spdx_id": {
//                         "type": [
//                           "string",
//                           "null"
//                         ],
//                         "examples": [
//                           "MIT"
//                         ]
//                       },
//                       "node_id": {
//                         "type": "string",
//                         "examples": [
//                           "MDc6TGljZW5zZW1pdA=="
//                         ]
//                       },
//                       "html_url": {
//                         "type": "string",
//                         "format": "uri"
//                       }
//                     },
//                     "required": [
//                       "key",
//                       "name",
//                       "url",
//                       "spdx_id",
//                       "node_id"
//                     ]
//                   }
//                 ]
//               },
//               "forks": {
//                 "type": "integer"
//               },
//               "permissions": {
//                 "type": "object",
//                 "properties": {
//                   "admin": {
//                     "type": "boolean"
//                   },
//                   "pull": {
//                     "type": "boolean"
//                   },
//                   "triage": {
//                     "type": "boolean"
//                   },
//                   "push": {
//                     "type": "boolean"
//                   },
//                   "maintain": {
//                     "type": "boolean"
//                   }
//                 },
//                 "required": [
//                   "admin",
//                   "pull",
//                   "push"
//                 ]
//               },
//               "owner": {
//                 "title": "Simple User",
//                 "description": "A GitHub user.",
//                 "type": "object",
//                 "properties": {
//                   "name": {
//                     "type": [
//                       "string",
//                       "null"
//                     ]
//                   },
//                   "email": {
//                     "type": [
//                       "string",
//                       "null"
//                     ]
//                   },
//                   "login": {
//                     "type": "string",
//                     "examples": [
//                       "octocat"
//                     ]
//                   },
//                   "id": {
//                     "type": "integer",
//                     "examples": [
//                       1
//                     ]
//                   },
//                   "node_id": {
//                     "type": "string",
//                     "examples": [
//                       "MDQ6VXNlcjE="
//                     ]
//                   },
//                   "avatar_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://github.com/images/error/octocat_happy.gif"
//                     ]
//                   },
//                   "gravatar_id": {
//                     "type": [
//                       "string",
//                       "null"
//                     ],
//                     "examples": [
//                       "41d064eb2195891e12d0413f63227ea7"
//                     ]
//                   },
//                   "url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat"
//                     ]
//                   },
//                   "html_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://github.com/octocat"
//                     ]
//                   },
//                   "followers_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat/followers"
//                     ]
//                   },
//                   "following_url": {
//                     "type": "string",
//                     "examples": [
//                       "https://api.github.com/users/octocat/following{/other_user}"
//                     ]
//                   },
//                   "gists_url": {
//                     "type": "string",
//                     "examples": [
//                       "https://api.github.com/users/octocat/gists{/gist_id}"
//                     ]
//                   },
//                   "starred_url": {
//                     "type": "string",
//                     "examples": [
//                       "https://api.github.com/users/octocat/starred{/owner}{/repo}"
//                     ]
//                   },
//                   "subscriptions_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat/subscriptions"
//                     ]
//                   },
//                   "organizations_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat/orgs"
//                     ]
//                   },
//                   "repos_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat/repos"
//                     ]
//                   },
//                   "events_url": {
//                     "type": "string",
//                     "examples": [
//                       "https://api.github.com/users/octocat/events{/privacy}"
//                     ]
//                   },
//                   "received_events_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://api.github.com/users/octocat/received_events"
//                     ]
//                   },
//                   "type": {
//                     "type": "string",
//                     "examples": [
//                       "User"
//                     ]
//                   },
//                   "site_admin": {
//                     "type": "boolean"
//                   },
//                   "starred_at": {
//                     "type": "string",
//                     "examples": [
//                       "\"2020-07-09T00:17:55Z\""
//                     ]
//                   }
//                 },
//                 "required": [
//                   "avatar_url",
//                   "events_url",
//                   "followers_url",
//                   "following_url",
//                   "gists_url",
//                   "gravatar_id",
//                   "html_url",
//                   "id",
//                   "node_id",
//                   "login",
//                   "organizations_url",
//                   "received_events_url",
//                   "repos_url",
//                   "site_admin",
//                   "starred_url",
//                   "subscriptions_url",
//                   "type",
//                   "url"
//                 ]
//               },
//               "private": {
//                 "description": "Whether the repository is private or public.",
//                 "default": false,
//                 "type": "boolean"
//               },
//               "html_url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "https://github.com/octocat/Hello-World"
//                 ]
//               },
//               "description": {
//                 "type": [
//                   "string",
//                   "null"
//                 ],
//                 "examples": [
//                   "This your first repo!"
//                 ]
//               },
//               "fork": {
//                 "type": "boolean"
//               },
//               "url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "https://api.github.com/repos/octocat/Hello-World"
//                 ]
//               },
//               "archive_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/{archive_format}{/ref}"
//                 ]
//               },
//               "assignees_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/assignees{/user}"
//                 ]
//               },
//               "blobs_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/git/blobs{/sha}"
//                 ]
//               },
//               "branches_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/branches{/branch}"
//                 ]
//               },
//               "collaborators_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/collaborators{/collaborator}"
//                 ]
//               },
//               "comments_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/comments{/number}"
//                 ]
//               },
//               "commits_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/commits{/sha}"
//                 ]
//               },
//               "compare_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/compare/{base}...{head}"
//                 ]
//               },
//               "contents_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/contents/{+path}"
//                 ]
//               },
//               "contributors_url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/contributors"
//                 ]
//               },
//               "deployments_url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/deployments"
//                 ]
//               },
//               "downloads_url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/downloads"
//                 ]
//               },
//               "events_url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/events"
//                 ]
//               },
//               "forks_url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/forks"
//                 ]
//               },
//               "git_commits_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/git/commits{/sha}"
//                 ]
//               },
//               "git_refs_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/git/refs{/sha}"
//                 ]
//               },
//               "git_tags_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/git/tags{/sha}"
//                 ]
//               },
//               "git_url": {
//                 "type": "string",
//                 "examples": [
//                   "git:github.com/octocat/Hello-World.git"
//                 ]
//               },
//               "issue_comment_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/issues/comments{/number}"
//                 ]
//               },
//               "issue_events_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/issues/events{/number}"
//                 ]
//               },
//               "issues_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/issues{/number}"
//                 ]
//               },
//               "keys_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/keys{/key_id}"
//                 ]
//               },
//               "labels_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/labels{/name}"
//                 ]
//               },
//               "languages_url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/languages"
//                 ]
//               },
//               "merges_url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/merges"
//                 ]
//               },
//               "milestones_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/milestones{/number}"
//                 ]
//               },
//               "notifications_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/notifications{?since,all,participating}"
//                 ]
//               },
//               "pulls_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/pulls{/number}"
//                 ]
//               },
//               "releases_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/releases{/id}"
//                 ]
//               },
//               "ssh_url": {
//                 "type": "string",
//                 "examples": [
//                   "git@github.com:octocat/Hello-World.git"
//                 ]
//               },
//               "stargazers_url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/stargazers"
//                 ]
//               },
//               "statuses_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/statuses/{sha}"
//                 ]
//               },
//               "subscribers_url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/subscribers"
//                 ]
//               },
//               "subscription_url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/subscription"
//                 ]
//               },
//               "tags_url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/tags"
//                 ]
//               },
//               "teams_url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/teams"
//                 ]
//               },
//               "trees_url": {
//                 "type": "string",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/git/trees{/sha}"
//                 ]
//               },
//               "clone_url": {
//                 "type": "string",
//                 "examples": [
//                   "https://github.com/octocat/Hello-World.git"
//                 ]
//               },
//               "mirror_url": {
//                 "type": [
//                   "string",
//                   "null"
//                 ],
//                 "format": "uri",
//                 "examples": [
//                   "git:git.example.com/octocat/Hello-World"
//                 ]
//               },
//               "hooks_url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "http://api.github.com/repos/octocat/Hello-World/hooks"
//                 ]
//               },
//               "svn_url": {
//                 "type": "string",
//                 "format": "uri",
//                 "examples": [
//                   "https://svn.github.com/octocat/Hello-World"
//                 ]
//               },
//               "homepage": {
//                 "type": [
//                   "string",
//                   "null"
//                 ],
//                 "format": "uri",
//                 "examples": [
//                   "https://github.com"
//                 ]
//               },
//               "language": {
//                 "type": [
//                   "string",
//                   "null"
//                 ]
//               },
//               "forks_count": {
//                 "type": "integer",
//                 "examples": [
//                   9
//                 ]
//               },
//               "stargazers_count": {
//                 "type": "integer",
//                 "examples": [
//                   80
//                 ]
//               },
//               "watchers_count": {
//                 "type": "integer",
//                 "examples": [
//                   80
//                 ]
//               },
//               "size": {
//                 "description": "The size of the repository, in kilobytes. Size is calculated hourly. When a repository is initially created, the size is 0.",
//                 "type": "integer",
//                 "examples": [
//                   108
//                 ]
//               },
//               "default_branch": {
//                 "description": "The default branch of the repository.",
//                 "type": "string",
//                 "examples": [
//                   "master"
//                 ]
//               },
//               "open_issues_count": {
//                 "type": "integer",
//                 "examples": [
//                   0
//                 ]
//               },
//               "is_template": {
//                 "description": "Whether this repository acts as a template that can be used to generate new repositories.",
//                 "default": false,
//                 "type": "boolean",
//                 "examples": [
//                   true
//                 ]
//               },
//               "topics": {
//                 "type": "array",
//                 "items": {
//                   "type": "string"
//                 }
//               },
//               "has_issues": {
//                 "description": "Whether issues are enabled.",
//                 "default": true,
//                 "type": "boolean",
//                 "examples": [
//                   true
//                 ]
//               },
//               "has_projects": {
//                 "description": "Whether projects are enabled.",
//                 "default": true,
//                 "type": "boolean",
//                 "examples": [
//                   true
//                 ]
//               },
//               "has_wiki": {
//                 "description": "Whether the wiki is enabled.",
//                 "default": true,
//                 "type": "boolean",
//                 "examples": [
//                   true
//                 ]
//               },
//               "has_pages": {
//                 "type": "boolean"
//               },
//               "has_downloads": {
//                 "description": "Whether downloads are enabled.",
//                 "default": true,
//                 "type": "boolean",
//                 "deprecated": true,
//                 "examples": [
//                   true
//                 ]
//               },
//               "has_discussions": {
//                 "description": "Whether discussions are enabled.",
//                 "default": false,
//                 "type": "boolean",
//                 "examples": [
//                   true
//                 ]
//               },
//               "archived": {
//                 "description": "Whether the repository is archived.",
//                 "default": false,
//                 "type": "boolean"
//               },
//               "disabled": {
//                 "type": "boolean",
//                 "description": "Returns whether or not this repository disabled."
//               },
//               "visibility": {
//                 "description": "The repository visibility: public, private, or internal.",
//                 "default": "public",
//                 "type": "string"
//               },
//               "pushed_at": {
//                 "type": [
//                   "string",
//                   "null"
//                 ],
//                 "format": "date-time",
//                 "examples": [
//                   "2011-01-26T19:06:43Z"
//                 ]
//               },
//               "created_at": {
//                 "type": [
//                   "string",
//                   "null"
//                 ],
//                 "format": "date-time",
//                 "examples": [
//                   "2011-01-26T19:01:12Z"
//                 ]
//               },
//               "updated_at": {
//                 "type": [
//                   "string",
//                   "null"
//                 ],
//                 "format": "date-time",
//                 "examples": [
//                   "2011-01-26T19:14:43Z"
//                 ]
//               },
//               "allow_rebase_merge": {
//                 "description": "Whether to allow rebase merges for pull requests.",
//                 "default": true,
//                 "type": "boolean",
//                 "examples": [
//                   true
//                 ]
//               },
//               "temp_clone_token": {
//                 "type": "string"
//               },
//               "allow_squash_merge": {
//                 "description": "Whether to allow squash merges for pull requests.",
//                 "default": true,
//                 "type": "boolean",
//                 "examples": [
//                   true
//                 ]
//               },
//               "allow_auto_merge": {
//                 "description": "Whether to allow Auto-merge to be used on pull requests.",
//                 "default": false,
//                 "type": "boolean",
//                 "examples": [
//                   false
//                 ]
//               },
//               "delete_branch_on_merge": {
//                 "description": "Whether to delete head branches when pull requests are merged",
//                 "default": false,
//                 "type": "boolean",
//                 "examples": [
//                   false
//                 ]
//               },
//               "allow_update_branch": {
//                 "description": "Whether or not a pull request head branch that is behind its base branch can always be updated even if it is not required to be up to date before merging.",
//                 "default": false,
//                 "type": "boolean",
//                 "examples": [
//                   false
//                 ]
//               },
//               "use_squash_pr_title_as_default": {
//                 "type": "boolean",
//                 "description": "Whether a squash merge commit can use the pull request title as default. **This property has been deprecated. Please use `squash_merge_commit_title` instead.",
//                 "default": false,
//                 "deprecated": true
//               },
//               "squash_merge_commit_title": {
//                 "type": "string",
//                 "enum": [
//                   "PR_TITLE",
//                   "COMMIT_OR_PR_TITLE"
//                 ],
//                 "description": "The default value for a squash merge commit title:\n\n- `PR_TITLE` - default to the pull request's title.\n- `COMMIT_OR_PR_TITLE` - default to the commit's title (if only one commit) or the pull request's title (when more than one commit)."
//               },
//               "squash_merge_commit_message": {
//                 "type": "string",
//                 "enum": [
//                   "PR_BODY",
//                   "COMMIT_MESSAGES",
//                   "BLANK"
//                 ],
//                 "description": "The default value for a squash merge commit message:\n\n- `PR_BODY` - default to the pull request's body.\n- `COMMIT_MESSAGES` - default to the branch's commit messages.\n- `BLANK` - default to a blank commit message."
//               },
//               "merge_commit_title": {
//                 "type": "string",
//                 "enum": [
//                   "PR_TITLE",
//                   "MERGE_MESSAGE"
//                 ],
//                 "description": "The default value for a merge commit title.\n\n- `PR_TITLE` - default to the pull request's title.\n- `MERGE_MESSAGE` - default to the classic title for a merge message (e.g., Merge pull request #123 from branch-name)."
//               },
//               "merge_commit_message": {
//                 "type": "string",
//                 "enum": [
//                   "PR_BODY",
//                   "PR_TITLE",
//                   "BLANK"
//                 ],
//                 "description": "The default value for a merge commit message.\n\n- `PR_TITLE` - default to the pull request's title.\n- `PR_BODY` - default to the pull request's body.\n- `BLANK` - default to a blank commit message."
//               },
//               "allow_merge_commit": {
//                 "description": "Whether to allow merge commits for pull requests.",
//                 "default": true,
//                 "type": "boolean",
//                 "examples": [
//                   true
//                 ]
//               },
//               "allow_forking": {
//                 "description": "Whether to allow forking this repo",
//                 "type": "boolean"
//               },
//               "web_commit_signoff_required": {
//                 "description": "Whether to require contributors to sign off on web-based commits",
//                 "default": false,
//                 "type": "boolean"
//               },
//               "open_issues": {
//                 "type": "integer"
//               },
//               "watchers": {
//                 "type": "integer"
//               },
//               "master_branch": {
//                 "type": "string"
//               },
//               "starred_at": {
//                 "type": "string",
//                 "examples": [
//                   "\"2020-07-09T00:17:42Z\""
//                 ]
//               },
//               "anonymous_access_enabled": {
//                 "type": "boolean",
//                 "description": "Whether anonymous git access is enabled for this repository"
//               }
//             },
//             "required": [
//               "archive_url",
//               "assignees_url",
//               "blobs_url",
//               "branches_url",
//               "collaborators_url",
//               "comments_url",
//               "commits_url",
//               "compare_url",
//               "contents_url",
//               "contributors_url",
//               "deployments_url",
//               "description",
//               "downloads_url",
//               "events_url",
//               "fork",
//               "forks_url",
//               "full_name",
//               "git_commits_url",
//               "git_refs_url",
//               "git_tags_url",
//               "hooks_url",
//               "html_url",
//               "id",
//               "node_id",
//               "issue_comment_url",
//               "issue_events_url",
//               "issues_url",
//               "keys_url",
//               "labels_url",
//               "languages_url",
//               "merges_url",
//               "milestones_url",
//               "name",
//               "notifications_url",
//               "owner",
//               "private",
//               "pulls_url",
//               "releases_url",
//               "stargazers_url",
//               "statuses_url",
//               "subscribers_url",
//               "subscription_url",
//               "tags_url",
//               "teams_url",
//               "trees_url",
//               "url",
//               "clone_url",
//               "default_branch",
//               "forks",
//               "forks_count",
//               "git_url",
//               "has_downloads",
//               "has_issues",
//               "has_projects",
//               "has_wiki",
//               "has_pages",
//               "homepage",
//               "language",
//               "archived",
//               "disabled",
//               "mirror_url",
//               "open_issues",
//               "open_issues_count",
//               "license",
//               "pushed_at",
//               "size",
//               "ssh_url",
//               "stargazers_count",
//               "svn_url",
//               "watchers",
//               "watchers_count",
//               "created_at",
//               "updated_at"
//             ]
//           },
//           "body_html": {
//             "type": "string"
//           },
//           "body_text": {
//             "type": "string"
//           },
//           "timeline_url": {
//             "type": "string",
//             "format": "uri"
//           },
//           "performed_via_github_app": {
//             "anyOf": [
//               {
//                 "type": "null"
//               },
//               {
//                 "title": "GitHub app",
//                 "description": "GitHub apps are a new way to extend GitHub. They can be installed directly on organizations and user accounts and granted access to specific repositories. They come with granular permissions and built-in webhooks. GitHub apps are first class actors within GitHub.",
//                 "type": "object",
//                 "properties": {
//                   "id": {
//                     "description": "Unique identifier of the GitHub app",
//                     "type": "integer",
//                     "examples": [
//                       37
//                     ]
//                   },
//                   "slug": {
//                     "description": "The slug name of the GitHub app",
//                     "type": "string",
//                     "examples": [
//                       "probot-owners"
//                     ]
//                   },
//                   "node_id": {
//                     "type": "string",
//                     "examples": [
//                       "MDExOkludGVncmF0aW9uMQ=="
//                     ]
//                   },
//                   "owner": {
//                     "anyOf": [
//                       {
//                         "type": "null"
//                       },
//                       {
//                         "title": "Simple User",
//                         "description": "A GitHub user.",
//                         "type": "object",
//                         "properties": {
//                           "name": {
//                             "type": [
//                               "string",
//                               "null"
//                             ]
//                           },
//                           "email": {
//                             "type": [
//                               "string",
//                               "null"
//                             ]
//                           },
//                           "login": {
//                             "type": "string",
//                             "examples": [
//                               "octocat"
//                             ]
//                           },
//                           "id": {
//                             "type": "integer",
//                             "examples": [
//                               1
//                             ]
//                           },
//                           "node_id": {
//                             "type": "string",
//                             "examples": [
//                               "MDQ6VXNlcjE="
//                             ]
//                           },
//                           "avatar_url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://github.com/images/error/octocat_happy.gif"
//                             ]
//                           },
//                           "gravatar_id": {
//                             "type": [
//                               "string",
//                               "null"
//                             ],
//                             "examples": [
//                               "41d064eb2195891e12d0413f63227ea7"
//                             ]
//                           },
//                           "url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://api.github.com/users/octocat"
//                             ]
//                           },
//                           "html_url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://github.com/octocat"
//                             ]
//                           },
//                           "followers_url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://api.github.com/users/octocat/followers"
//                             ]
//                           },
//                           "following_url": {
//                             "type": "string",
//                             "examples": [
//                               "https://api.github.com/users/octocat/following{/other_user}"
//                             ]
//                           },
//                           "gists_url": {
//                             "type": "string",
//                             "examples": [
//                               "https://api.github.com/users/octocat/gists{/gist_id}"
//                             ]
//                           },
//                           "starred_url": {
//                             "type": "string",
//                             "examples": [
//                               "https://api.github.com/users/octocat/starred{/owner}{/repo}"
//                             ]
//                           },
//                           "subscriptions_url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://api.github.com/users/octocat/subscriptions"
//                             ]
//                           },
//                           "organizations_url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://api.github.com/users/octocat/orgs"
//                             ]
//                           },
//                           "repos_url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://api.github.com/users/octocat/repos"
//                             ]
//                           },
//                           "events_url": {
//                             "type": "string",
//                             "examples": [
//                               "https://api.github.com/users/octocat/events{/privacy}"
//                             ]
//                           },
//                           "received_events_url": {
//                             "type": "string",
//                             "format": "uri",
//                             "examples": [
//                               "https://api.github.com/users/octocat/received_events"
//                             ]
//                           },
//                           "type": {
//                             "type": "string",
//                             "examples": [
//                               "User"
//                             ]
//                           },
//                           "site_admin": {
//                             "type": "boolean"
//                           },
//                           "starred_at": {
//                             "type": "string",
//                             "examples": [
//                               "\"2020-07-09T00:17:55Z\""
//                             ]
//                           }
//                         },
//                         "required": [
//                           "avatar_url",
//                           "events_url",
//                           "followers_url",
//                           "following_url",
//                           "gists_url",
//                           "gravatar_id",
//                           "html_url",
//                           "id",
//                           "node_id",
//                           "login",
//                           "organizations_url",
//                           "received_events_url",
//                           "repos_url",
//                           "site_admin",
//                           "starred_url",
//                           "subscriptions_url",
//                           "type",
//                           "url"
//                         ]
//                       }
//                     ]
//                   },
//                   "name": {
//                     "description": "The name of the GitHub app",
//                     "type": "string",
//                     "examples": [
//                       "Probot Owners"
//                     ]
//                   },
//                   "description": {
//                     "type": [
//                       "string",
//                       "null"
//                     ],
//                     "examples": [
//                       "The description of the app."
//                     ]
//                   },
//                   "external_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://example.com"
//                     ]
//                   },
//                   "html_url": {
//                     "type": "string",
//                     "format": "uri",
//                     "examples": [
//                       "https://github.com/apps/super-ci"
//                     ]
//                   },
//                   "created_at": {
//                     "type": "string",
//                     "format": "date-time",
//                     "examples": [
//                       "2017-07-08T16:18:44-04:00"
//                     ]
//                   },
//                   "updated_at": {
//                     "type": "string",
//                     "format": "date-time",
//                     "examples": [
//                       "2017-07-08T16:18:44-04:00"
//                     ]
//                   },
//                   "permissions": {
//                     "description": "The set of permissions for the GitHub app",
//                     "type": "object",
//                     "properties": {
//                       "issues": {
//                         "type": "string"
//                       },
//                       "checks": {
//                         "type": "string"
//                       },
//                       "metadata": {
//                         "type": "string"
//                       },
//                       "contents": {
//                         "type": "string"
//                       },
//                       "deployments": {
//                         "type": "string"
//                       }
//                     },
//                     "additionalProperties": {
//                       "type": "string"
//                     },
//                     "example": {
//                       "issues": "read",
//                       "deployments": "write"
//                     }
//                   },
//                   "events": {
//                     "description": "The list of events for the GitHub app",
//                     "type": "array",
//                     "items": {
//                       "type": "string"
//                     },
//                     "examples": [
//                       "label",
//                       "deployment"
//                     ]
//                   },
//                   "installations_count": {
//                     "description": "The number of installations associated with the GitHub app",
//                     "type": "integer",
//                     "examples": [
//                       5
//                     ]
//                   },
//                   "client_id": {
//                     "type": "string",
//                     "examples": [
//                       "\"Iv1.25b5d1e65ffc4022\""
//                     ]
//                   },
//                   "client_secret": {
//                     "type": "string",
//                     "examples": [
//                       "\"1d4b2097ac622ba702d19de498f005747a8b21d3\""
//                     ]
//                   },
//                   "webhook_secret": {
//                     "type": [
//                       "string",
//                       "null"
//                     ],
//                     "examples": [
//                       "\"6fba8f2fc8a7e8f2cca5577eddd82ca7586b3b6b\""
//                     ]
//                   },
//                   "pem": {
//                     "type": "string",
//                     "examples": [
//                       "\"-----BEGIN RSA PRIVATE KEY-----\\nMIIEogIBAAKCAQEArYxrNYD/iT5CZVpRJu4rBKmmze3PVmT/gCo2ATUvDvZTPTey\\nxcGJ3vvrJXazKk06pN05TN29o98jrYz4cengG3YGsXPNEpKsIrEl8NhbnxapEnM9\\nJCMRe0P5JcPsfZlX6hmiT7136GRWiGOUba2X9+HKh8QJVLG5rM007TBER9/z9mWm\\nrJuNh+m5l320oBQY/Qq3A7wzdEfZw8qm/mIN0FCeoXH1L6B8xXWaAYBwhTEh6SSn\\nZHlO1Xu1JWDmAvBCi0RO5aRSKM8q9QEkvvHP4yweAtK3N8+aAbZ7ovaDhyGz8r6r\\nzhU1b8Uo0Z2ysf503WqzQgIajr7Fry7/kUwpgQIDAQABAoIBADwJp80Ko1xHPZDy\\nfcCKBDfIuPvkmSW6KumbsLMaQv1aGdHDwwTGv3t0ixSay8CGlxMRtRDyZPib6SvQ\\n6OH/lpfpbMdW2ErkksgtoIKBVrDilfrcAvrNZu7NxRNbhCSvN8q0s4ICecjbbVQh\\nnueSdlA6vGXbW58BHMq68uRbHkP+k+mM9U0mDJ1HMch67wlg5GbayVRt63H7R2+r\\nVxcna7B80J/lCEjIYZznawgiTvp3MSanTglqAYi+m1EcSsP14bJIB9vgaxS79kTu\\noiSo93leJbBvuGo8QEiUqTwMw4tDksmkLsoqNKQ1q9P7LZ9DGcujtPy4EZsamSJT\\ny8OJt0ECgYEA2lxOxJsQk2kI325JgKFjo92mQeUObIvPfSNWUIZQDTjniOI6Gv63\\nGLWVFrZcvQBWjMEQraJA9xjPbblV8PtfO87MiJGLWCHFxmPz2dzoedN+2Coxom8m\\nV95CLz8QUShuao6u/RYcvUaZEoYs5bHcTmy5sBK80JyEmafJPtCQVxMCgYEAy3ar\\nZr3yv4xRPEPMat4rseswmuMooSaK3SKub19WFI5IAtB/e7qR1Rj9JhOGcZz+OQrl\\nT78O2OFYlgOIkJPvRMrPpK5V9lslc7tz1FSh3BZMRGq5jSyD7ETSOQ0c8T2O/s7v\\nbeEPbVbDe4mwvM24XByH0GnWveVxaDl51ABD65sCgYB3ZAspUkOA5egVCh8kNpnd\\nSd6SnuQBE3ySRlT2WEnCwP9Ph6oPgn+oAfiPX4xbRqkL8q/k0BdHQ4h+zNwhk7+h\\nWtPYRAP1Xxnc/F+jGjb+DVaIaKGU18MWPg7f+FI6nampl3Q0KvfxwX0GdNhtio8T\\nTj1E+SnFwh56SRQuxSh2gwKBgHKjlIO5NtNSflsUYFM+hyQiPiqnHzddfhSG+/3o\\nm5nNaSmczJesUYreH5San7/YEy2UxAugvP7aSY2MxB+iGsiJ9WD2kZzTUlDZJ7RV\\nUzWsoqBR+eZfVJ2FUWWvy8TpSG6trh4dFxImNtKejCR1TREpSiTV3Zb1dmahK9GV\\nrK9NAoGAbBxRLoC01xfxCTgt5BDiBcFVh4fp5yYKwavJPLzHSpuDOrrI9jDn1oKN\\nonq5sDU1i391zfQvdrbX4Ova48BN+B7p63FocP/MK5tyyBoT8zQEk2+vWDOw7H/Z\\nu5dTCPxTIsoIwUw1I+7yIxqJzLPFgR2gVBwY1ra/8iAqCj+zeBw=\\n-----END RSA PRIVATE KEY-----\\n\""
//                     ]
//                   }
//                 },
//                 "required": [
//                   "id",
//                   "node_id",
//                   "owner",
//                   "name",
//                   "description",
//                   "external_url",
//                   "html_url",
//                   "created_at",
//                   "updated_at",
//                   "permissions",
//                   "events"
//                 ]
//               }
//             ]
//           },
//           "reactions": {
//             "title": "Reaction Rollup",
//             "type": "object",
//             "properties": {
//               "url": {
//                 "type": "string",
//                 "format": "uri"
//               },
//               "total_count": {
//                 "type": "integer"
//               },
//               "+1": {
//                 "type": "integer"
//               },
//               "-1": {
//                 "type": "integer"
//               },
//               "laugh": {
//                 "type": "integer"
//               },
//               "confused": {
//                 "type": "integer"
//               },
//               "heart": {
//                 "type": "integer"
//               },
//               "hooray": {
//                 "type": "integer"
//               },
//               "eyes": {
//                 "type": "integer"
//               },
//               "rocket": {
//                 "type": "integer"
//               }
//             },
//             "required": [
//               "url",
//               "total_count",
//               "+1",
//               "-1",
//               "laugh",
//               "confused",
//               "heart",
//               "hooray",
//               "eyes",
//               "rocket"
//             ]
//           }
//         },
//         "required": [
//           "assignee",
//           "closed_at",
//           "comments",
//           "comments_url",
//           "events_url",
//           "html_url",
//           "id",
//           "node_id",
//           "labels",
//           "labels_url",
//           "milestone",
//           "number",
//           "repository_url",
//           "state",
//           "locked",
//           "title",
//           "url",
//           "user",
//           "author_association",
//           "created_at",
//           "updated_at",
//           "score"
//         ]
//       }
//     }
//   }
// }