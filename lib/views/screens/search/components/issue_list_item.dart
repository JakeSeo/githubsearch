import 'package:flutter/material.dart';
import 'package:githubsearch/utils.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/github_issue/info.dart';
import '../../../../models/search_response/info.dart';
import '../../../webview_screen.dart';

class IssueListItem extends StatelessWidget {
  const IssueListItem({
    super.key,
    required this.issue,
  });
  final GithubIssueInfo issue;

  _goToWebViewScreen(BuildContext context, {required String url}) {
    context.pushNamed(WebViewScreen.name, queryParameters: {
      "url": url,
    });
  }

  @override
  Widget build(BuildContext context) {
    final urlSplit = issue.repositoryUrl.split("/");
    return GestureDetector(
      onTap: () => _goToWebViewScreen(context, url: issue.htmlUrl),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            issue.pullRequest == null
                ? SearchType.issues.icon
                : SearchType.pullRequest.icon,
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
    );
  }
}
