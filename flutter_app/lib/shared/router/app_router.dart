import 'package:flutter/material.dart';
import 'package:flutter_app/features/chat/presentation/views/chat_list/chats_list_screen.dart';
import 'package:flutter_app/shared/ui/home_scafold.dart';
import 'package:flutter_app/shared/ui/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/chat/presentation/views/chat_thread/chat_thread_screen.dart';
import '../../features/webview/presentation/views/web_view_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      routes: [
        GoRoute(
          path: '/',
          name: ChatListScreen.routeName,
          builder: (context, state) => const ChatListScreen(),
          routes: [
            GoRoute(
              path: '/chat/:id',
              name: ChatThreadScreen.routeName,
              parentNavigatorKey: rootNavigatorKey,
              builder:
                  (context, state) => ChatThreadScreen(
                    chatThreadId: state.pathParameters['id']!,
                  ),
            ),
          ],
        ),
        GoRoute(
          path: '/webview',
          name: WebViewScreen.routeName,
          builder: (context, state) => const WebViewScreen(),
        ),
      ],
      builder: (context, state, child) {
        return HomeScaffold(child: child);
      },
    ),
    GoRoute(
      path: '/splash',
      name: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
