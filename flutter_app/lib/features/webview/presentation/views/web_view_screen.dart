import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends HookWidget {
  static const String routeName = 'webview';

  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(
      () =>
          WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(Uri.parse('http://localhost:4201')),
    );

    return Scaffold(
      // appBar: AppBar(title: const Text('WebView'), centerTitle: false),
      body: SafeArea(child: WebViewWidget(controller: controller)),
    );
  }
}
