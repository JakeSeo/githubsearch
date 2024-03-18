import 'package:flutter/material.dart';
import 'package:githubsearch/utils.dart';
import 'package:go_router/go_router.dart';

import '../../../../injector.dart';
import '../../../../models/github_repository/info.dart';
import '../../../../models/github_user/info.dart';
import '../../../webview_screen.dart';

class RepositoryListItem extends StatelessWidget {
  const RepositoryListItem({
    super.key,
    required this.repository,
  });
  final GithubRepositoryInfo repository;

  _goToWebViewScreen(BuildContext context, {required String url}) {
    context.pushNamed(WebViewScreen.name, queryParameters: {
      "url": url,
    });
  }

  @override
  Widget build(BuildContext context) {
    final plColorString = injector
        .get<Map<String, dynamic>>(
            instanceName: "plColors")[repository.language]?["color"]
        ?.toString();
    final plColor = plColorString?.toColor();
    return GestureDetector(
      onTap: () => _goToWebViewScreen(context, url: repository.htmlUrl),
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: repository.owner!.type == UserType.organization
                    ? BorderRadius.circular(4)
                    : BorderRadius.circular(16),
                child: Image.network(
                  repository.owner!.avatarUrl,
                  height: 16,
                  width: 16,
                ),
              ),
              const SizedBox(width: 4),
              Text(repository.owner!.login,
                  style: TextStyle(color: Colors.grey.shade400)),
            ],
          ),
          Row(
            children: [
              Text(
                repository.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          if (repository.description != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Text(
                    repository.description!,
                  ),
                )
              ],
            ),
          ],
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.star_rounded,
                color: Colors.yellow.shade600,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(repository.stargazersCount.shortened()),
              const SizedBox(width: 8),
              CircleAvatar(
                  radius: 6, backgroundColor: plColor, child: const SizedBox()),
              const SizedBox(width: 4),
              Text("${repository.language}"),
            ],
          ),
        ],
      ),
    );
  }
}
