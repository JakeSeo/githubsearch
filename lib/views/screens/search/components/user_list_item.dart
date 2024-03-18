import 'package:flutter/material.dart';

import '../../../../models/github_user/info.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.user,
  });
  final GithubUserInfo user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
