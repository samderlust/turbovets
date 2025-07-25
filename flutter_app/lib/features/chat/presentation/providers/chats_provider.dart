import 'package:collection/collection.dart';
import 'package:flutter_app/features/chat/domain/entities/chat_overview.dart';
import 'package:flutter_app/features/core/domain/entities/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'chat_repo_provider.dart';

part 'chats_provider.g.dart';

@riverpod
class Chats extends _$Chats {
  @override
  Future<List<ChatThread>> build() async {
    final chatRepo = ref.read(chatRepoProvider);
    final resp = await chatRepo.getChats();

    return resp.when(
      value: (value) => value,
      failed: (error, st) => throw error,
    );
  }

  ChatThread? getChatOverviewById(String id) {
    return state.asData?.value.firstWhereOrNull((chat) => chat.id == id);
  }
}
