import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/features/chat/domain/entities/message.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../user/presentation/providers/auth_user_provider.dart';

class MessageInputWidget extends HookConsumerWidget {
  const MessageInputWidget({super.key, this.onSend});

  final Function(Message)? onSend;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final textCtrl = useTextEditingController();
    final pickedFiles = useState<List<XFile>>([]);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          if (pickedFiles.value.isNotEmpty)
            SizedBox(
              height: 70,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: pickedFiles.value.length,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final file = pickedFiles.value[index];
                  return Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorScheme.primaryContainer,
                          image: DecorationImage(
                            image: FileImage(File(file.path)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton.filled(
                          style: IconButton.styleFrom(
                            backgroundColor: colorScheme.error,
                            fixedSize: Size.fromRadius(15),
                            maximumSize: Size.fromRadius(15),
                            minimumSize: Size.fromRadius(15),
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            pickedFiles.value = [...pickedFiles.value]
                              ..removeAt(index);
                          },
                          icon: Icon(Icons.close),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          Row(
            children: [
              MenuAnchor(
                menuChildren: [
                  MenuItemButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10,
                      children: [Icon(Icons.image), Text('Gallery')],
                    ),
                    onPressed: () async {
                      final picker = ImagePicker();
                      final files = await picker.pickMultipleMedia();
                      if (files.isNotEmpty) {
                        pickedFiles.value = [...pickedFiles.value, ...files];
                      }
                    },
                  ),
                  MenuItemButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10,
                      children: [Icon(Icons.camera), Text('Camera')],
                    ),
                    onPressed: () async {
                      final picker = ImagePicker();
                      final file = await picker.pickImage(
                        source: ImageSource.camera,
                      );
                      if (file != null) {
                        pickedFiles.value = [...pickedFiles.value, file];
                      }
                    },
                  ),
                ],
                builder:
                    (context, controller, child) => IconButton(
                      color: colorScheme.primary,
                      onPressed: () {
                        controller.isOpen
                            ? controller.close()
                            : controller.open();
                      },
                      icon: Icon(Icons.attach_file),
                    ),
              ),

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
                    onPressed:
                        value.text.trim().isEmpty && pickedFiles.value.isEmpty
                            ? null
                            : () async {
                              final messageText = textCtrl.text.trim();
                              final currentUser =
                                  ref.read(authUserProvider).value!;
                              final message = Message(
                                id: uuid.v4(),
                                text: messageText,
                                sender: currentUser,
                                chatThreadId: '',
                                timestamp: DateTime.now(),
                                file:
                                    pickedFiles.value
                                        .map((e) => e.path)
                                        .toList(),
                              );

                              textCtrl.clear();
                              pickedFiles.value = [];

                              onSend?.call(message);
                            },
                    icon: Icon(Icons.send),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
