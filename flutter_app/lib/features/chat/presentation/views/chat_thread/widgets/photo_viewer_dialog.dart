import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/chat/domain/entities/message.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:photo_view/photo_view_gallery.dart';

void showPhotoViewerDialog(
  BuildContext context,
  Message theMessage,
  int index,
) {
  showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) {
      return PhotoViewerDialog(theMessage: theMessage, index: index);
    },
  );
}

class PhotoViewerDialog extends HookWidget {
  const PhotoViewerDialog({
    super.key,
    required this.theMessage,
    required this.index,
  });

  final Message theMessage;
  final int index;

  @override
  Widget build(BuildContext context) {
    final pageCtrl = usePageController(initialPage: index);

    return Dialog.fullscreen(
      child: Stack(
        children: [
          PhotoViewGallery.builder(
            pageController: pageCtrl,
            itemCount: theMessage.file.length,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: FileImage(File(theMessage.file[index])),
              );
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: IconButton.filledTonal(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
