import 'dart:async';

import 'package:flutter_app/features/chat/domain/entities/chat_thread.dart';
import 'package:flutter_app/features/chat/domain/entities/message.dart';
import 'package:flutter_app/features/chat/domain/repo/chat_repo.dart';
import 'package:flutter_app/features/core/domain/entities/result.dart';
import 'package:hive_ce/hive.dart';

import '../../../../shared/constraints/hive_constraints.dart';

final class HiveChatRepo implements ChatRepoFacade {
  final _streamController = StreamController<Message>.broadcast();

  @override
  Future<Result<List<ChatThread>>> getChats() async {
    try {
      final box = await Hive.openBox<ChatThread>(HiveBoxes.chatThreads);
      final chats = box.values.toList();
      return Result.value(chats);
    } catch (e, st) {
      return Result.failed(e, st);
    }
  }

  @override
  Stream<Message> getMessageStream(String chatThreadId) {
    return _streamController.stream.where((m) {
      return m.chatThreadId == chatThreadId;
    });
  }

  @override
  Future<Result<List<Message>>> getMessages(String chatThreadId) async {
    try {
      final box = await Hive.openBox<Message>(HiveBoxes.messages);
      final messages = box.values.where((m) => m.chatThreadId == chatThreadId);
      return Result.value(messages.toList());
    } catch (e, st) {
      return Result.failed(e, st);
    }
  }

  @override
  Future<Result<void>> sendMessage(Message message) async {
    try {
      final box = await Hive.openBox<Message>(HiveBoxes.messages);
      await box.put(message.id, message);
      _streamController.add(message);
      return Result.value(null);
    } catch (e, st) {
      return Result.failed(e, st);
    }
  }
}
