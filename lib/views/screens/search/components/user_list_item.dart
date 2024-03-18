import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/github_user/info.dart';
import '../../../webview_screen.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.user,
  });
  final GithubUserInfo user;

  _goToWebViewScreen(BuildContext context, {required String url}) {
    context.pushNamed(WebViewScreen.name, queryParameters: {
      "url": url,
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _goToWebViewScreen(context, url: user.htmlUrl),
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: user.type == UserType.organization
            ? BorderRadius.circular(4)
            : BorderRadius.circular(21),
        child: Image.network(
          user.avatarUrl,
          width: 42,
          height: 42,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(user.login),
        ],
      ),
    );
  }
}
