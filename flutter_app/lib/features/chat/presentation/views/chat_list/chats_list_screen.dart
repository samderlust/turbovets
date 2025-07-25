import 'package:flutter/material.dart';

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
        actions: [Switch(value: true, onChanged: (_) {})],
      ),
      body: ChatThreadsListView(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Action for the button can be defined here
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(content: Text('Floating Action Button Pressed')),
      //     );
      //   },
      //   child: const Icon(Icons.chat),
      // ),
    );
  }
}
