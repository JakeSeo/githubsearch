import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../blocs/search/bloc.dart';
import '../../../models/search_response/info.dart';
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

  @override
  void initState() {
    super.initState();
    _initializeSearchBlocs();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _queryFocusNode.requestFocus();
    });
  }

  _initializeSearchBlocs() {
    _searchUsersBloc.add(SearchInitialize());
    _searchOrganizationsBloc.add(SearchInitialize());
  }

  _search(String query) {
    _searchUsersBloc.add(Search(q: query));
    _searchOrganizationsBloc.add(Search(q: query));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SearchUsersBloc, SearchState>(
          bloc: _searchUsersBloc,
          listener: (context, state) {
            if (state is Searched) {
              if (!_searched) {
                _searched = true;
                setState(() {});
              }
            }
          },
        ),
        BlocListener<SearchOrganizationsBloc, SearchState>(
          bloc: _searchOrganizationsBloc,
          listener: (context, state) {
            if (state is Searched) {
              if (!_searched) {
                _searched = true;
                setState(() {});
              }
            }
          },
        ),
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
              _searched = false;
              setState(() {});
            },
            onFieldSubmitted: (value) => _search(value),
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
                      child: MultiBlocProvider(providers: [
                        BlocProvider(create: (_) => _searchUsersBloc),
                        BlocProvider(create: (_) => _searchOrganizationsBloc),
                      ], child: const SearchResultWidget()),
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
