import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../blocs/search/bloc.dart';
import '../../../models/search_response/info.dart';
import '../search_result_screen.dart';
import 'components/search_result_widget.dart';

class SearchScreen extends StatefulWidget {
  static const String name = "search";
  static const String path = "/search";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _queryController = TextEditingController();
  final FocusNode _queryFocusNode = FocusNode();

  bool _searched = false;
  final SearchUsersBloc _searchUsersBloc = SearchUsersBloc();
  final SearchOrganizationsBloc _searchOrganizationsBloc =
      SearchOrganizationsBloc();
  final SearchIssuesBloc _searchIssuesBloc = SearchIssuesBloc();
  final SearchPullRequestsBloc _searchPullRequestsBloc =
      SearchPullRequestsBloc();
  final SearchRepositoriesBloc _searchRepositoriesBloc =
      SearchRepositoriesBloc();
  final SearchCodeBloc _searchCodeBloc = SearchCodeBloc();

  @override
  void initState() {
    super.initState();
    _initializeSearchBlocs();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _queryFocusNode.requestFocus();
    });
  }

  @override
  dispose() async {
    _searchCodeBloc.close();
    _searchUsersBloc.close();
    _searchOrganizationsBloc.close();
    _searchIssuesBloc.close();
    _searchPullRequestsBloc.close();
    _searchRepositoriesBloc.close();
    super.dispose();
  }

  _initializeSearchBlocs() {
    _searchCodeBloc.add(SearchInitialize());
    _searchUsersBloc.add(SearchInitialize());
    _searchOrganizationsBloc.add(SearchInitialize());
    _searchIssuesBloc.add(SearchInitialize());
    _searchPullRequestsBloc.add(SearchInitialize());
    _searchRepositoriesBloc.add(SearchInitialize());
  }

  _search(String query) {
    _searchCodeBloc.add(Search(q: query));
    _searchUsersBloc.add(Search(q: query));
    _searchOrganizationsBloc.add(Search(q: query));
    _searchIssuesBloc.add(Search(q: query));
    _searchPullRequestsBloc.add(Search(q: query));
    _searchRepositoriesBloc.add(Search(q: query));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => _searchCodeBloc),
        BlocProvider(create: (_) => _searchUsersBloc),
        BlocProvider(create: (_) => _searchOrganizationsBloc),
        BlocProvider(create: (_) => _searchIssuesBloc),
        BlocProvider(create: (_) => _searchPullRequestsBloc),
        BlocProvider(create: (_) => _searchRepositoriesBloc),
      ],
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 8,
          title: TextFormField(
            controller: _queryController,
            focusNode: _queryFocusNode,
            decoration: InputDecoration(
              hintText: "GitHub 검색",
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              suffixIconConstraints: const BoxConstraints(),
              suffixIcon: _queryController.text.isEmpty
                  ? null
                  : GestureDetector(
                      onTap: () {
                        _queryController.text = "";
                        _searched = false;
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.close,
                        size: 20,
                      ),
                    ),
            ),
            onChanged: (value) {
              if (_searched) {
                _initializeSearchBlocs();
              }
              _searched = false;
              setState(() {});
            },
            onFieldSubmitted: (value) {
              _search(value);

              _searched = true;
              setState(() {});
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Visibility(
                      visible: _queryController.text.isNotEmpty && !_searched,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: SearchType.values.length + 1,
                        itemBuilder: (context, index) {
                          if (index == SearchType.values.length) {
                            return ListTile(
                                tileColor: Colors.white,
                                leading: Icon(Icons.arrow_forward_rounded,
                                    color: Colors.grey.shade500),
                                title: Text(
                                  "\"${_queryController.text}\"으로 이동",
                                ));
                          }
                          final searchType = SearchType.values[index];
                          return ListTile(
                            onTap: () {
                              late SearchBloc bloc;
                              switch (searchType) {
                                case SearchType.code:
                                  bloc = _searchCodeBloc;
                                  break;
                                case SearchType.repositories:
                                  bloc = _searchRepositoriesBloc;
                                  break;
                                case SearchType.issues:
                                  bloc = _searchIssuesBloc;
                                  break;
                                case SearchType.pullRequest:
                                  bloc = _searchPullRequestsBloc;
                                  break;
                                case SearchType.users:
                                  bloc = _searchUsersBloc;
                                  break;
                                case SearchType.organizations:
                                  bloc = _searchOrganizationsBloc;
                                  break;
                              }
                              context.pushNamed(
                                SearchResultScreen.name,
                                pathParameters: {
                                  "type": searchType.value,
                                },
                                queryParameters: {"q": _queryController.text},
                                extra: bloc,
                              );
                            },
                            tileColor: Colors.white,
                            leading: Icon(searchType.icon,
                                color: Colors.grey.shade500),
                            title: Text(
                              "\"${_queryController.text}\"이(가) 포함된 ${searchType.label}",
                            ),
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: _searched,
                      child: SearchResultWidget(query: _queryController.text),
                    ),
                  ],
                ),
              ),
            ),
            KeyboardVisibilityBuilder(
              builder: (context, keyboardIsVisible) {
                if (!keyboardIsVisible) return const SizedBox();
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  color: Colors.grey.shade100,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 8,
                      children: QueryFilter.values
                          .map(
                            (filter) => ActionChip(
                              onPressed: () {
                                _queryController.text =
                                    "${_queryController.text}${filter.filter}";
                                _searched = false;
                                setState(() {});
                              },
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  style: BorderStyle.none,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: Colors.grey.shade300,
                              label: Text(
                                filter.label,
                                style: GoogleFonts.sourceCodePro(),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum QueryFilter {
  repo(label: "repo", filter: "repo:"),
  user(label: "user", filter: "user:"),
  org(label: "org", filter: "org:"),
  path(label: "path", filter: "path:"),
  symbol(label: "symbol", filter: "symbol:"),
  language(label: "language", filter: "language:"),
  content(label: "content", filter: "content:"),
  regex(label: "/regex/", filter: "//"),
  and(label: "AND", filter: "AND"),
  or(label: "OR", filter: "OR"),
  not(label: "NOT", filter: "NOT");

  final String label, filter;
  const QueryFilter({required this.label, required this.filter});
}
