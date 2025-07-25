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
    final resp = await chatRepo.getMessages(chatThreadId);
    return resp.when(
      value: (value) {
        return {
          for (final message in value)
            message.id: MessageViewModel(message: message),
        };
      },
      failed: (error, st) => throw error,
    );
  }

  Future<void> sendMessage(MessageViewModel message) async {
    final messages = state.asData?.value ?? {};

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
