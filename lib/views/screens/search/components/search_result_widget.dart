import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubsearch/utils.dart';
import 'package:githubsearch/utils.dart' as utils;
import 'package:go_router/go_router.dart';

import '../../../../blocs/search/bloc.dart';
import '../../../../models/github_code/info.dart';
import '../../../../models/github_issue/info.dart';
import '../../../../models/github_repository/info.dart';
import '../../../../models/github_user/info.dart';
import '../../../../models/search_response/info.dart';
import '../../search_result_screen.dart';
import 'code_list_item.dart';
import 'issue_list_item.dart';
import 'repository_list_item.dart';
import 'user_list_item.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    super.key,
    required this.query,
  });

  final String query;

  _goToSearchResultScreen(
    BuildContext context, {
    required SearchType searchType,
    required SearchBloc searchBloc,
  }) {
    context.pushNamed(
      SearchResultScreen.name,
      pathParameters: {"type": searchType.value},
      queryParameters: {"q": query},
      extra: searchBloc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _buildCodeListSection(),
          _buildRepositoriesSection(),
          _buildIssuesSection(),
          _buildPullRequestsSection(),
          _buildUserListSection(),
          _buildOrganizationListSection(),
        ],
      ),
    );
  }

  _buildCodeListSection() {
    return BlocBuilder<SearchCodeBloc, SearchState>(
      builder: (context, state) {
        if (state is Searching) {
          return const SizedBox();
        }
        if (state is Searched && state.result.isEmpty) {
          return const SizedBox();
        }
        return Column(
          children: [
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(
                    "코드",
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
                GithubCodeInfo code = state.result[index] as GithubCodeInfo;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CodeListItem(code: code),
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
            if (!(!state.hasMore && state.result.length <= 3)) ...[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _goToSearchResultScreen(context,
                    searchType: SearchType.code,
                    searchBloc: context.read<SearchCodeBloc>()),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text(
                        "${(state.totalCount - 3).shortened()}개의 코드 더 보기",
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey.shade400,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            Divider(color: Colors.grey.shade200),
          ],
        );
      },
    );
  }

  _buildRepositoriesSection() {
    return BlocBuilder<SearchRepositoriesBloc, SearchState>(
      builder: (context, state) {
        if (state is Searching) {
          return const SizedBox();
        }
        if (state is Searched && state.result.isEmpty) {
          return const SizedBox();
        }
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
            if (!(!state.hasMore && state.result.length <= 3)) ...[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _goToSearchResultScreen(context,
                    searchType: SearchType.repositories,
                    searchBloc: context.read<SearchRepositoriesBloc>()),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text(
                        "${(state.totalCount - 3).shortened()}개의 리포지토리 더 보기",
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey.shade400,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            Divider(color: Colors.grey.shade200),
          ],
        );
      },
    );
  }

  _buildIssuesSection() {
    return BlocBuilder<SearchIssuesBloc, SearchState>(
      builder: (context, state) {
        if (state is Searching) {
          return const SizedBox();
        }
        if (state is Searched && state.result.isEmpty) {
          return const SizedBox();
        }
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
            if (!(!state.hasMore && state.result.length <= 3)) ...[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _goToSearchResultScreen(context,
                    searchType: SearchType.issues,
                    searchBloc: context.read<SearchIssuesBloc>()),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text(
                        "${(state.totalCount - 3).shortened()}개의 이슈 더 보기",
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey.shade400,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            Divider(color: Colors.grey.shade200),
          ],
        );
      },
    );
  }

  _buildPullRequestsSection() {
    return BlocBuilder<SearchPullRequestsBloc, SearchState>(
      builder: (context, state) {
        if (state is Searching) {
          return const SizedBox();
        }
        if (state is Searched && state.result.isEmpty) {
          return const SizedBox();
        }
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
            if (!(!state.hasMore && state.result.length <= 3)) ...[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _goToSearchResultScreen(context,
                    searchType: SearchType.pullRequest,
                    searchBloc: context.read<SearchPullRequestsBloc>()),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text(
                        "${(state.totalCount - 3).shortened()}개의 Pull Request 더 보기",
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey.shade400,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            Divider(color: Colors.grey.shade200),
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
          if (state is Searching) {
            return const SizedBox();
          }
          if (state is Searched && state.result.isEmpty) {
            return const SizedBox();
          }
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
              if (!(!state.hasMore && state.result.length <= 3)) ...[
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _goToSearchResultScreen(context,
                      searchType: SearchType.users,
                      searchBloc: context.read<SearchUsersBloc>()),
                  child: Row(
                    children: [
                      Text(
                        "${(state.totalCount - 3).shortened()}명 더 보기",
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey.shade400,
                        size: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
              Divider(color: Colors.grey.shade200),
            ],
          );
        },
      ),
    );
  }

  _buildOrganizationListSection() {
    return BlocBuilder<SearchOrganizationsBloc, SearchState>(
      builder: (context, state) {
        if (state is Searching) {
          return const SizedBox();
        }
        if (state is Searched && state.result.isEmpty) {
          return const SizedBox();
        }
        return Column(
          children: [
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(
                    "조직",
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
                GithubUserInfo user = state.result[index] as GithubUserInfo;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: UserListItem(user: user),
                );
              },
            ),
            const SizedBox(height: 8),
            if (!(!state.hasMore && state.result.length <= 3)) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _goToSearchResultScreen(context,
                      searchType: SearchType.organizations,
                      searchBloc: context.read<SearchOrganizationsBloc>()),
                  child: Row(
                    children: [
                      Text(
                        "${(state.totalCount - 3).shortened()}개 조직 더 보기",
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey.shade400,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ],
        );
      },
    );
  }
}
