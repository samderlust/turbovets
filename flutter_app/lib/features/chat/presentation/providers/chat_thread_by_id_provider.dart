import 'dart:developer';

import 'package:flutter_app/features/chat/domain/entities/message.dart';
import 'package:flutter_app/features/core/domain/entities/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../view_models/message_view_models.dart';
import 'chat_repo_provider.dart';

part 'chat_thread_by_id_provider.g.dart';

@riverpod
class ChatThreadById extends _$ChatThreadById {
  @override
  Future<Map<String, MessageViewModel>> build(String chatThreadId) async {
    final chatRepo = ref.read(chatRepoProvider);
    final subscription = chatRepo.getMessageStream(chatThreadId).listen((
      event,
    ) {
      log("event Received $event");
      state = AsyncData({
        ...state.asData!.value,
        event.id: MessageViewModel(message: event),
      });
    });

    ref.onDispose(() {
      subscription.cancel();
    });

    final resp = await chatRepo.getMessages(chatThreadId);

    return resp.when(
      value: (value) {
        ref.keepAlive();
        return {
          for (final message in value)
            message.id: MessageViewModel(message: message),
        };
      },
      failed: (error, st) => throw error,
    );
  }

  Future<void> sendMessage(Message payload) async {
    final messages = state.asData?.value ?? {};

    final message = MessageViewModel(
      message: payload,
      status: MessageStatus.sending,
    );

    state = AsyncData({
      ...messages,
      message.message.id: message.copyWith(status: MessageStatus.sending),
    });

    final chatRepo = ref.read(chatRepoProvider);
    final resp = await chatRepo.sendMessage(message.message);

    resp.when(
      value: (value) {
        state = AsyncData({
          ...messages,
          message.message.id: message.copyWith(status: MessageStatus.sent),
        });
      },
      failed: (error, st) {
        state = AsyncData({
          ...messages,
          message.message.id: message.copyWith(status: MessageStatus.failed),
        });
      },
    );
  }
}
