import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class GithubUserInfo {
  @JsonKey(name: "login")
  final String login;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "node_id")
  final String nodeId;
  @JsonKey(name: "avatar_url")
  final String avatarUrl;
  @JsonKey(name: "gravatar_id")
  final String? gravatarId;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "html_url")
  final String htmlUrl;
  @JsonKey(name: "followers_url")
  final String followersUrl;
  @JsonKey(name: "following_url")
  final String followingUrl;
  @JsonKey(name: "gists_url")
  final String gistsUrl;
  @JsonKey(name: "starred_url")
  final String starredUrl;
  @JsonKey(name: "subscriptions_url")
  final String subscriptionsUrl;
  @JsonKey(name: "organizations_url")
  final String organizationsUrl;
  @JsonKey(name: "repos_url")
  final String reposUrl;
  @JsonKey(name: "events_url")
  final String eventsUrl;
  @JsonKey(name: "received_events_url")
  final String receivedEventsUrl;
  @JsonKey(name: "type")
  final UserType type;
  @JsonKey(name: "site_admin")
  final bool siteAdmin;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "company")
  final String? company;
  @JsonKey(name: "blog")
  final String blog;
  @JsonKey(name: "location")
  final String? location;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "hireable")
  final bool? hireable;
  @JsonKey(name: "bio")
  final String? bio;
  @JsonKey(name: "twitter_username")
  final String? twitterUsername;
  @JsonKey(name: "public_repos")
  final int publicRepos;
  @JsonKey(name: "public_gists")
  final int publicGists;
  @JsonKey(name: "followers")
  final int followers;
  @JsonKey(name: "following")
  final int following;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  GithubUserInfo({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
    this.name,
    this.company,
    this.blog = "",
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.twitterUsername,
    this.publicRepos = 0,
    this.publicGists = 0,
    this.followers = 0,
    this.following = 0,
    this.createdAt,
    this.updatedAt,
  });
  factory GithubUserInfo.fromJson(Map<String, dynamic> json) =>
      _$GithubUserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$GithubUserInfoToJson(this);
}

enum UserType {
  @JsonValue("User")
  user,
  @JsonValue("Organization")
  organization,
}

// /user
// {
//   "login": "JakeSeo",
//   "id": 10471865,
//   "node_id": "MDQ6VXNlcjEwNDcxODY1",
//   "avatar_url": "https://avatars.githubusercontent.com/u/10471865?v=4",
//   "gravatar_id": "",
//   "url": "https://api.github.com/users/JakeSeo",
//   "html_url": "https://github.com/JakeSeo",
//   "followers_url": "https://api.github.com/users/JakeSeo/followers",
//   "following_url": "https://api.github.com/users/JakeSeo/following{/other_user}",
//   "gists_url": "https://api.github.com/users/JakeSeo/gists{/gist_id}",
//   "starred_url": "https://api.github.com/users/JakeSeo/starred{/owner}{/repo}",
//   "subscriptions_url": "https://api.github.com/users/JakeSeo/subscriptions",
//   "organizations_url": "https://api.github.com/users/JakeSeo/orgs",
//   "repos_url": "https://api.github.com/users/JakeSeo/repos",
//   "events_url": "https://api.github.com/users/JakeSeo/events{/privacy}",
//   "received_events_url": "https://api.github.com/users/JakeSeo/received_events",
//   "type": "User",
//   "site_admin": false,
//   "name": "DongSeong Seo",
//   "company": null,
//   "blog": "",
//   "location": "서울",
//   "email": "dev.jsds@gmail.com",
//   "hireable": null,
//   "bio": null,
//   "twitter_username": null,
//   "public_repos": 19,
//   "public_gists": 0,
//   "followers": 0,
//   "following": 2,
//   "created_at": "2015-01-10T03:10:02Z",
//   "updated_at": "2024-03-13T20:37:58Z"
// }

// /search/users
//  {
//   "login": "mojombo",
//   "id": 1,
//   "node_id": "MDQ6VXNlcjE=",
//   "avatar_url": "https://secure.gravatar.com/avatar/25c7c18223fb42a4c6ae1c8db6f50f9b?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
//   "gravatar_id": "",
//   "url": "https://api.github.com/users/mojombo",
//   "html_url": "https://github.com/mojombo",
//   "followers_url": "https://api.github.com/users/mojombo/followers",
//   "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
//   "organizations_url": "https://api.github.com/users/mojombo/orgs",
//   "repos_url": "https://api.github.com/users/mojombo/repos",
//   "received_events_url": "https://api.github.com/users/mojombo/received_events",
//   "type": "User",
//   "score": 1,
//   "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
//   "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
//   "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
//   "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
//   "site_admin": true
// }

// /search/repositories
// {
//   "login": "dtrupenn",
//   "id": 872147,
//   "node_id": "MDQ6VXNlcjg3MjE0Nw==",
//   "avatar_url": "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
//   "gravatar_id": "",
//   "url": "https://api.github.com/users/dtrupenn",
//   "received_events_url": "https://api.github.com/users/dtrupenn/received_events",
//   "type": "User",
//   "html_url": "https://github.com/octocat",
//   "followers_url": "https://api.github.com/users/octocat/followers",
//   "following_url": "https://api.github.com/users/octocat/following{/other_user}",
//   "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
//   "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
//   "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
//   "organizations_url": "https://api.github.com/users/octocat/orgs",
//   "repos_url": "https://api.github.com/users/octocat/repos",
//   "events_url": "https://api.github.com/users/octocat/events{/privacy}",
//   "site_admin": true
// },

// /search/issues
// {
//   "login": "Nick3C",
//   "id": 90254,
//   "node_id": "MDQ6VXNlcjkwMjU0",
//   "avatar_url": "https://secure.gravatar.com/avatar/934442aadfe3b2f4630510de416c5718?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png",
//   "gravatar_id": "",
//   "url": "https://api.github.com/users/Nick3C",
//   "html_url": "https://github.com/Nick3C",
//   "followers_url": "https://api.github.com/users/Nick3C/followers",
//   "following_url": "https://api.github.com/users/Nick3C/following{/other_user}",
//   "gists_url": "https://api.github.com/users/Nick3C/gists{/gist_id}",
//   "starred_url": "https://api.github.com/users/Nick3C/starred{/owner}{/repo}",
//   "subscriptions_url": "https://api.github.com/users/Nick3C/subscriptions",
//   "organizations_url": "https://api.github.com/users/Nick3C/orgs",
//   "repos_url": "https://api.github.com/users/Nick3C/repos",
//   "events_url": "https://api.github.com/users/Nick3C/events{/privacy}",
//   "received_events_url": "https://api.github.com/users/Nick3C/received_events",
//   "type": "User",
//   "site_admin": true
// },

// /search/commits
// {
//   "login": "octocat",
//   "id": 583231,
//   "node_id": "MDQ6VXNlcjU4MzIzMQ==",
//   "avatar_url": "https://avatars.githubusercontent.com/u/583231?v=3",
//   "gravatar_id": "",
//   "url": "https://api.github.com/users/octocat",
//   "html_url": "https://github.com/octocat",
//   "followers_url": "https://api.github.com/users/octocat/followers",
//   "following_url": "https://api.github.com/users/octocat/following{/other_user}",
//   "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
//   "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
//   "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
//   "organizations_url": "https://api.github.com/users/octocat/orgs",
//   "repos_url": "https://api.github.com/users/octocat/repos",
//   "events_url": "https://api.github.com/users/octocat/events{/privacy}",
//   "received_events_url": "https://api.github.com/users/octocat/received_events",
//   "type": "User",
//   "site_admin": false
// },

// /search/code
// {
//   "login": "jquery",
//   "id": 70142,
//   "node_id": "MDQ6VXNlcjcwMTQy",
//   "avatar_url": "https://0.gravatar.com/avatar/6906f317a4733f4379b06c32229ef02f?d=https%3A%2F%2Fidenticons.github.com%2Ff426f04f2f9813718fb806b30e0093de.png",
//   "gravatar_id": "",
//   "url": "https://api.github.com/users/jquery",
//   "html_url": "https://github.com/jquery",
//   "followers_url": "https://api.github.com/users/jquery/followers",
//   "following_url": "https://api.github.com/users/jquery/following{/other_user}",
//   "gists_url": "https://api.github.com/users/jquery/gists{/gist_id}",
//   "starred_url": "https://api.github.com/users/jquery/starred{/owner}{/repo}",
//   "subscriptions_url": "https://api.github.com/users/jquery/subscriptions",
//   "organizations_url": "https://api.github.com/users/jquery/orgs",
//   "repos_url": "https://api.github.com/users/jquery/repos",
//   "events_url": "https://api.github.com/users/jquery/events{/privacy}",
//   "received_events_url": "https://api.github.com/users/jquery/received_events",
//   "type": "Organization",
//   "site_admin": false
// },