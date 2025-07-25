import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MessageInputWidget extends HookConsumerWidget {
  const MessageInputWidget({super.key, required this.threadId});

  final String threadId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final textCtrl = useTextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textCtrl,
              style: TextStyle(fontSize: 14),
              maxLines: null,
              decoration: InputDecoration(
                fillColor: colorScheme.primaryContainer,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                isDense: true,
                isCollapsed: true,
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: colorScheme.primary),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          ValueListenableBuilder(
            valueListenable: textCtrl,
            builder: (context, value, child) {
              return IconButton(
                color: colorScheme.primary,
                onPressed: value.text.trim().isEmpty ? null : () async {},
                icon: Icon(Icons.send),
              );
            },
          ),
        ],
      ),
    );
  }
}
