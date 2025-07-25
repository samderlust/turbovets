import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/chat/domain/entities/message.dart';
import 'package:flutter_app/features/chat/presentation/views/chat_thread/widgets/photo_viewer_dialog.dart';

class MessagePhotoPreviewer extends StatelessWidget {
  const MessagePhotoPreviewer({super.key, required this.theMessage});

  final Message theMessage;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemCount: theMessage.file.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final file = theMessage.file[index];
          return GestureDetector(
            onTap: () {
              showPhotoViewerDialog(context, theMessage, index);
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: colorScheme.primaryContainer,
                image: DecorationImage(
                  image: FileImage(File(file)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
