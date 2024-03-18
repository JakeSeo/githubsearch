import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/github_code/info.dart';
import '../../../../models/github_user/info.dart';
import '../../../webview_screen.dart';

class CodeListItem extends StatelessWidget {
  const CodeListItem({super.key, required this.code});

  final GithubCodeInfo code;

  _goToWebViewScreen(BuildContext context, {required String url}) {
    context.pushNamed(WebViewScreen.name, queryParameters: {
      "url": url,
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _goToWebViewScreen(context, url: code.htmlUrl),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius:
                    code.repository.owner!.type == UserType.organization
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
      ),
    );
  }
}
