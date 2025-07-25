import 'package:flutter/material.dart';
import 'package:flutter_app/features/chat/presentation/providers/chats_provider.dart';
import 'package:flutter_app/features/chat/presentation/view_models/message_view_models.dart';
import 'package:flutter_app/features/chat/presentation/views/chat_thread/widgets/message_bubble.dart';
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

    final scrollCtrl = useScrollController();

    useEffect(() {
      // check if scrollCtrl is attached the scrollview
      // and data is ready, scroll to the bottom
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // if chatThread is not ready or scrollFirstTime is true, do nothing
        if (!chatThread.hasValue) {
          return;
        }

        if (scrollCtrl.hasClients) {
          scrollCtrl.animateTo(
            scrollCtrl.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      });

      return null;
    }, [chatThread]);

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
                  return ChatListView(
                    messages: messages.values.toList(),
                    scrollCtrl: scrollCtrl,
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              ),
            ),
            const Divider(height: 0),
            MessageInputWidget(
              threadId: chatThreadId,
              onPostSend: () {
                // scrollCtrl.animateTo(
                //   scrollCtrl.position.maxScrollExtent + 100,
                //   duration: const Duration(milliseconds: 300),
                //   curve: Curves.easeInOut,
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChatListView extends ConsumerWidget {
  const ChatListView({
    super.key,
    required this.messages,

    required this.scrollCtrl,
  });

  final List<MessageViewModel> messages;
  final ScrollController scrollCtrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      controller: scrollCtrl,
      padding: EdgeInsets.symmetric(horizontal: 10),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];

        return MessageBubble(
          key: ValueKey(message.message.id),
          onRetryMessage: () {
            ref
                .read(
                  chatThreadByIdProvider(message.message.chatThreadId).notifier,
                )
                .sendMessage(message.message);
          },
          message: message,
        );
      },
    );
  }
}
