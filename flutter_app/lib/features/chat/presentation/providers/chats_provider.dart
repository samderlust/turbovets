import 'package:flutter_app/features/chat/domain/entities/chat_thread.dart';
import 'package:flutter_app/features/core/domain/entities/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'chat_repo_provider.dart';

part 'chats_provider.g.dart';

@riverpod
class Chats extends _$Chats {
  @override
  Future<Map<String, ChatThread>> build() async {
    final chatRepo = ref.read(chatRepoProvider);
    final resp = await chatRepo.getChats();

    // listen to chat thread stream
    final subscription = chatRepo.getChatThreadStream().listen((event) {
      // remove the old value and update, so that the thread will move to the top
      final data = state.asData?.value ?? {};
      data.removeWhere((key, value) => key == event.id);

      state = AsyncData({event.id: event, ...data});
    });

    ref.onDispose(() {
      subscription.cancel();
    });

    return resp.when(
      value: (value) {
        ref.keepAlive();
        return {for (final chat in value) chat.id: chat};
      },
      failed: (error, st) => throw error,
    );
  }

  ChatThread? getChatOverviewById(String id) {
    return state.asData?.value[id];
  }

  Future<bool> createChatThread(ChatThread chatThread) async {
    final chatRepo = ref.read(chatRepoProvider);
    final resp = await chatRepo.createChatThread(chatThread);

    return resp.when(
      value: (value) {
        state = AsyncData({...state.asData!.value, chatThread.id: chatThread});
        return true;
      },
      failed: (error, st) {
        return false;
      },
    );
  }
}
