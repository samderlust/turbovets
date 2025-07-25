import 'package:flutter/material.dart';
import 'package:flutter_app/features/chat/presentation/providers/chats_provider.dart';
import 'package:flutter_app/features/chat/presentation/providers/user_provider.dart';
import 'package:flutter_app/features/chat/presentation/view_models/message_view_models.dart';
import 'package:flutter_app/features/chat/presentation/views/chat_thread/widgets/message_input_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/chat_thread_by_id_provider.dart';

class ChatThreadScreen extends HookConsumerWidget {
  static const String routeName = 'chatThread';
  final String chatThreadId;
  const ChatThreadScreen({super.key, required this.chatThreadId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatThread = ref.watch(chatThreadByIdProvider(chatThreadId));

    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            final chatOverview = ref
                .watch(chatsProvider.notifier)
                .getChatOverviewById(chatThreadId);

            if (chatOverview == null) {
              return const Text('Chat Deails');
            }
            return Text(
              chatOverview.participants.map((e) => e.name).join(', '),
            );
          },
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: chatThread.when(
                data: (messages) {
                  return ChatListView(messages: messages.values.toList());
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              ),
            ),
            MessageInputWidget(threadId: chatThreadId),
          ],
        ),
      ),
    );
  }
}

class ChatListView extends ConsumerWidget {
  const ChatListView({super.key, required this.messages});

  final List<MessageViewModel> messages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.sizeOf(context);

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 10),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index].message;
        final isSender = message.sender.id == ref.watch(myUserProvider).id;

        return Container(
          margin: EdgeInsets.only(
            left: isSender ? size.width * 0.1 : 0,
            right: isSender ? 0 : size.width * 0.1,
          ),

          alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              if (!isSender)
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(message.sender.avatarUrl),
                ),
              const SizedBox(width: 8),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorScheme.primaryContainer,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [Text(message.text)],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (isSender)
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(message.sender.avatarUrl),
                ),
            ],
          ),
        );
      },
    );
  }
}
