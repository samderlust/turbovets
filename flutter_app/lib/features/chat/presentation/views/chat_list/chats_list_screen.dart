import 'package:flutter/material.dart';

import '../../../../../shared/ui/theme_switcher.dart';
import '../new_chat/new_chat_dialog.dart';
import 'chat_list_view.dart';

class ChatListScreen extends StatelessWidget {
  static const String routeName = 'chatList';
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        centerTitle: false,
        actions: [ThemeSwitcher()],
      ),
      body: ChatThreadsListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showCreateNewChatDialog(context),
        child: const Icon(Icons.chat),
      ),
    );
  }
}
