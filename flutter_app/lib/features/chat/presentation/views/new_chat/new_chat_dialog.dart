import 'package:flutter/material.dart';
import 'package:flutter_app/features/chat/presentation/views/chat_thread/widgets/message_input_widget.dart';
import 'package:flutter_app/features/user/presentation/providers/auth_user_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../main.dart';
import '../../../../user/domain/entities/user.dart';
import '../../../../user/presentation/providers/user_list_providers.dart';
import '../../../domain/entities/chat_thread.dart';
import '../../providers/chats_provider.dart';
import '../chat_thread/chat_thread_screen.dart';

Future<void> showCreateNewChatDialog(BuildContext context) {
  return showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) {
      return const NewChatDialog();
    },
  );
}

class NewChatDialog extends HookConsumerWidget {
  const NewChatDialog({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final userListState = ref.watch(userListProvider);

    final selectedUsers = useState<List<User>>([]);

    return Dialog.fullscreen(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('New Chat', style: textTheme.headlineMedium),
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              Expanded(
                child: userListState.when(
                  loading:
                      () => const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(child: Text('Error: $error')),
                  data: (users) {
                    return ListView.separated(
                      itemCount: users.length,
                      separatorBuilder:
                          (context, index) => const Divider(height: 0),
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return CheckboxListTile(
                          value: selectedUsers.value.contains(user),
                          onChanged: (value) {
                            if (selectedUsers.value.contains(user)) {
                              selectedUsers.value =
                                  selectedUsers.value..remove(user);
                            } else {
                              selectedUsers.value = [
                                ...selectedUsers.value,
                                user,
                              ];
                            }
                          },
                          title: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(user.avatarUrl),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  user.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              MessageInputWidget(
                onSend: (message) async {
                  final authUser = ref.read(authUserProvider).value!;
                  final threadId = uuid.v4();
                  final newMessage = message.copyWith(chatThreadId: threadId);
                  final newThread = ChatThread(
                    id: threadId,
                    lastMessage: newMessage,
                    participants: [...selectedUsers.value, authUser],
                  );

                  final res = await ref
                      .read(chatsProvider.notifier)
                      .createChatThread(newThread);
                  if (!context.mounted) return;
                  if (!res) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Failed to create chat')),
                    );
                  } else {
                    // pop the dialog
                    context.pop();
                    // go to the chat thread screen
                    context.pushNamed(
                      ChatThreadScreen.routeName,
                      pathParameters: {'id': threadId},
                    );
                  }
                  // create new chat thread
                  // send message
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
