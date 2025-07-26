import 'package:flutter/material.dart';
import 'package:flutter_app/features/chat/presentation/views/chat_thread/chat_thread_screen.dart';
import 'package:flutter_app/shared/formartters/time_formaters.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../providers/chats_provider.dart';
import '../new_chat/new_chat_dialog.dart';

class ChatThreadsListView extends HookConsumerWidget {
  const ChatThreadsListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(chatsProvider);

    return listState.when(
      data: (chats) {
        if (chats.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                Text(
                  'No chats found',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    showCreateNewChatDialog(context);
                  },
                  child: Text(
                    'Create new chat',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(chatsProvider);
          },
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 0),
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chat = chats.values.elementAt(index);
              return MaterialButton(
                onPressed: () {
                  context.pushNamed(
                    ChatThreadScreen.routeName,
                    pathParameters: {'id': chat.id},
                  );
                },

                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: CachedNetworkImageProvider(
                        chat.lastMessage.sender.avatarUrl,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chat.lastMessage.sender.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            chat.lastMessage.text,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            dateTimeFormatter.format(
                              chat.lastMessage.timestamp,
                            ),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error:
          (error, stackTrace) => Center(
            child: Text(
              'Error loading chats: $error',
              style: const TextStyle(color: Colors.red),
            ),
          ),
    );
  }
}
