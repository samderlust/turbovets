import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends HookWidget {
  static const String routeName = 'webview';

  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = useState<bool>(true);
    final controller = useMemoized(
      () =>
          WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setNavigationDelegate(
              NavigationDelegate(
                onPageStarted: (url) {
                  isLoading.value = true;
                },
                onPageFinished: (url) {
                  isLoading.value = false;
                },
                onProgress: (progress) {
                  debugPrint('WebView is loading (progress : $progress%)');
                },
              ),
            )
            ..loadRequest(
              Uri.parse(
                Platform.isAndroid
                    ? 'http://10.0.2.2:4201'
                    : 'http://localhost:4201',
              ),
            ),
    );

    return Scaffold(
      // appBar: AppBar(title: const Text('WebView'), centerTitle: false),
      body: SafeArea(
        child:
            isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : WebViewWidget(controller: controller),
      ),
    );
  }
}
