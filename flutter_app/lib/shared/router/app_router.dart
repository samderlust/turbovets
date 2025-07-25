import 'package:flutter/material.dart';
import 'package:flutter_app/features/chat/presentation/views/chat_list/chats_list_screen.dart';
import 'package:flutter_app/shared/ui/home_scafold.dart';
import 'package:go_router/go_router.dart';

import '../../features/chat/presentation/views/chat_thread/chat_thread_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
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
          name: 'web',
          builder: (context, state) => const SizedBox.shrink(),
        ),
      ],
      builder: (context, state, child) {
        return HomeScaffold(child: child);
      },
    ),
  ],
);
