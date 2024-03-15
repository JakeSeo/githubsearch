import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _queryFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 8,
        title: TextFormField(
          controller: _queryController,
          focusNode: _queryFocusNode,
          decoration: const InputDecoration(
            hintText: "GitHub 검색",
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
          ),
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
          const Expanded(child: SizedBox()),
          KeyboardVisibilityBuilder(
            builder: (context, keyboardIsVisible) {
              if (!keyboardIsVisible) return const SizedBox();
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
