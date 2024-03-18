import 'package:flutter/widgets.dart';

import '../../../../models/github_code/info.dart';
import '../../../../models/github_user/info.dart';

class CodeListItem extends StatelessWidget {
  const CodeListItem({super.key, required this.code});

  final GithubCodeInfo code;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: code.repository.owner!.type == UserType.organization
                  ? BorderRadius.circular(4)
                  : BorderRadius.circular(16),
              child: Image.network(
                code.repository.owner!.avatarUrl,
                height: 16,
                width: 16,
              ),
            ),
            const SizedBox(width: 4),
            Text(code.repository.fullName),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(code.path),
            ),
          ],
        )
      ],
    );
  }
}
