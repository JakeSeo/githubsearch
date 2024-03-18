import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  static const String name = "webview";
  static const String path = "/webview";

  const WebViewScreen({super.key, required this.url});

  final String url;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final WebViewController _controller = WebViewController();
  int _progress = 0;
  @override
  void initState() {
    super.initState();
    _controller.setBackgroundColor(Colors.white);
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (progress) {
          _progress = progress;
          setState(() {});
        },
        onPageStarted: (url) {},
        onPageFinished: (url) {},
        onWebResourceError: (error) {},
        onNavigationRequest: (request) {
          return NavigationDecision.navigate;
        },
      ),
    );
    _controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: LinearProgressIndicator(
            value: _progress / 100,
            color: _progress == 100 ? Colors.transparent : null,
            minHeight: 2,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          Expanded(
            child: WebViewWidget(
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}
