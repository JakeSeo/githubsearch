import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/search/bloc.dart';
import '../../models/github_code/info.dart';
import '../../models/github_issue/info.dart';
import '../../models/github_repository/info.dart';
import '../../models/github_user/info.dart';
import '../../models/search_response/info.dart';
import 'search/components/code_list_item.dart';
import 'search/components/issue_list_item.dart';
import 'search/components/repository_list_item.dart';
import 'search/components/user_list_item.dart';

class SearchResultScreen extends StatefulWidget {
  static const String name = "search-result";
  static const String path = ":type";
  const SearchResultScreen({
    super.key,
    required this.query,
    required this.type,
    required this.bloc,
  });

  final String query;
  final SearchType? type;
  final SearchBloc? bloc;

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  SearchType? get _type => widget.type;
  SearchBloc? get _bloc => widget.bloc;
  String get query => widget.query;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (_bloc == null) return;
    if (_bloc!.state is SearchInitial || _bloc!.state is SearchInitialized) {
      _bloc!.add(Search(q: query));
    }
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        _bloc!.add(LoadMore());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_bloc == null || _type == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text("오류가 발생했습니다."),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _type!.label,
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        bloc: _bloc!,
        builder: (context, state) {
          if (!state.hasMore && state.result.isEmpty) {
            return const Center(
              child: Text(
                "여기에 표시되는 항목 없음",
              ),
            );
          }
          return Container(
            color: Colors.white,
            child: ListView.separated(
              controller: _scrollController,
              itemBuilder: (context, index) {
                switch (_type!) {
                  case SearchType.code:
                    GithubCodeInfo code = state.result[index] as GithubCodeInfo;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: CodeListItem(code: code),
                    );

                  case SearchType.repositories:
                    GithubRepositoryInfo repository =
                        state.result[index] as GithubRepositoryInfo;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: RepositoryListItem(repository: repository),
                    );
                  case SearchType.issues:
                    GithubIssueInfo issue =
                        state.result[index] as GithubIssueInfo;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: IssueListItem(issue: issue),
                    );
                  case SearchType.pullRequest:
                    GithubIssueInfo issue =
                        state.result[index] as GithubIssueInfo;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: IssueListItem(issue: issue),
                    );
                  case SearchType.users:
                    GithubUserInfo user = state.result[index] as GithubUserInfo;
                    return UserListItem(user: user);
                  case SearchType.organizations:
                    GithubUserInfo user = state.result[index] as GithubUserInfo;
                    return UserListItem(user: user);
                }
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey.shade200,
                  thickness: 0.5,
                );
              },
              itemCount: state.result.length,
            ),
          );
        },
      ),
    );
  }
}
