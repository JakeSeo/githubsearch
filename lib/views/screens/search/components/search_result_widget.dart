import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubsearch/utils.dart';
import 'package:githubsearch/utils.dart' as utils;

import '../../../../blocs/search/bloc.dart';
import '../../../../models/github_issue/info.dart';
import '../../../../models/github_repository/info.dart';
import '../../../../models/github_user/info.dart';
import '../../../../models/search_response/info.dart';
import 'issue_list_item.dart';
import 'repository_list_item.dart';
import 'user_list_item.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildRepositoriesSection(),
          Divider(color: Colors.grey.shade200),
          _buildIssuesSection(),
          Divider(color: Colors.grey.shade200),
          _buildPullRequestsSection(),
          Divider(color: Colors.grey.shade200),
          _buildUserListSection(),
          Divider(color: Colors.grey.shade200),
          _buildOrganizationListSection(),
        ],
      ),
    );
  }

  _buildRepositoriesSection() {
    return BlocBuilder<SearchRepositoriesBloc, SearchState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(
                    "리포지토리",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.result.length < 3 ? state.result.length : 3,
              itemBuilder: (context, index) {
                GithubRepositoryInfo repository =
                    state.result[index] as GithubRepositoryInfo;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: RepositoryListItem(repository: repository),
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                      thickness: 0.5,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(
                    "${(state.totalCount - 3).shortened()}개의 리포지토리 더 보기",
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey.shade400,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  _buildIssuesSection() {
    return BlocBuilder<SearchIssuesBloc, SearchState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(
                    "이슈",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.result.length < 3 ? state.result.length : 3,
              itemBuilder: (context, index) {
                GithubIssueInfo issue = state.result[index] as GithubIssueInfo;

                final urlSplit = issue.repositoryUrl.split("/");
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            SearchType.issues.icon,
                            color: issue.state == "open"
                                ? Colors.green.shade400
                                : Colors.purple.shade400,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${urlSplit[urlSplit.length - 2]}/${urlSplit.last} #${issue.number}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(issue.title),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            issue.updatedAt.differenceString(),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                      thickness: 0.5,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(
                    "${(state.totalCount - 3).shortened()}개의 이슈 더 보기",
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey.shade400,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  _buildPullRequestsSection() {
    return BlocBuilder<SearchPullRequestsBloc, SearchState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(
                    "Pull Requests",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.result.length < 3 ? state.result.length : 3,
              itemBuilder: (context, index) {
                GithubIssueInfo issue = state.result[index] as GithubIssueInfo;

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: IssueListItem(issue: issue),
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                      thickness: 0.5,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(
                    "${(state.totalCount - 3).shortened()}개의 PullRequest 더 보기",
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey.shade400,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  _buildUserListSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: BlocBuilder<SearchUsersBloc, SearchState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text(
                    "사용자",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.result.length < 3 ? state.result.length : 3,
                itemBuilder: (context, index) {
                  GithubUserInfo user = state.result[index] as GithubUserInfo;
                  return UserListItem(user: user);
                },
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "${(state.totalCount - 3).shortened()}명 더 보기",
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey.shade400,
                      size: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }

  _buildOrganizationListSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: BlocBuilder<SearchOrganizationsBloc, SearchState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text(
                    "조직",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.result.length < 3 ? state.result.length : 3,
                itemBuilder: (context, index) {
                  GithubUserInfo user = state.result[index] as GithubUserInfo;
                  return UserListItem(user: user);
                },
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "${(state.totalCount - 3).shortened()}개 조직 더 보기",
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey.shade400,
                      size: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
