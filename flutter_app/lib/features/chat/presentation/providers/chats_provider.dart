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
}
