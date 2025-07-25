import 'package:flutter/material.dart';
import 'package:flutter_app/features/chat/presentation/view_models/message_view_models.dart';
import 'package:flutter_app/features/chat/presentation/views/chat_thread/widgets/message_photo_previewer.dart';
import 'package:flutter_app/shared/formartters/time_formaters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/user_provider.dart';

class MessageBubble extends ConsumerWidget {
  const MessageBubble({super.key, required this.message, this.onRetryMessage});

  final MessageViewModel message;
  final VoidCallback? onRetryMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final theMessage = message.message;

    final status = message.status;
    final isSender = theMessage.sender.id == ref.watch(myUserProvider).id;
    return Container(
      margin: EdgeInsets.only(
        left: isSender ? size.width * 0.1 : 0,
        right: isSender ? 0 : size.width * 0.1,
      ),

      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            !isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              if (!isSender)
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(theMessage.sender.avatarUrl),
                ),
              switch (status) {
                MessageStatus.sending => Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: const CircularProgressIndicator(strokeWidth: 1),
                  ),
                ),
                MessageStatus.failed => GestureDetector(
                  onTap: onRetryMessage,
                  child: Icon(Icons.refresh, color: colorScheme.error),
                ),

                _ => const SizedBox.shrink(),
              },
              const SizedBox(width: 8),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:
                        status.isFailed
                            ? colorScheme.error
                            : isSender
                            ? colorScheme.primary
                            : colorScheme.primaryContainer,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      if (theMessage.file.isNotEmpty)
                        MessagePhotoPreviewer(theMessage: theMessage),
                      Text(
                        theMessage.text,
                        style: TextStyle(
                          color:
                              status.isFailed
                                  ? colorScheme.onError
                                  : isSender
                                  ? colorScheme.onPrimary
                                  : colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (isSender)
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(theMessage.sender.avatarUrl),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              right: isSender ? 0 : 8,
              left: isSender ? 8 : 0,
            ),
            child: Text(
              switch (theMessage.timestamp) {
                var t when t.difference(DateTime.now()).inDays == 0 =>
                  timeOnlyFormatter.format(theMessage.timestamp),
                _ => dateTimeFormatter.format(theMessage.timestamp),
              },
              style: TextStyle(
                color: colorScheme.onSurfaceVariant,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
