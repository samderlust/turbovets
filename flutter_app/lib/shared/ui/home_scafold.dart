import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class HomeScaffold extends HookWidget {
  final Widget child;

  const HomeScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.web), label: 'WebView'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          currentIndex.value = index;
          switch (index) {
            case 0:
              context.go('/');
              // You can also use GoRouter if you prefer
              break;
            case 1:
              context.go('/webview');
              break;
            case 2:
              context.go('/settings');
              break;
          }
        },
      ),
    );
  }
}
