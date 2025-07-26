import 'dart:async';
import 'dart:developer';

import 'package:flutter_app/features/chat/domain/entities/chat_thread.dart';
import 'package:flutter_app/features/chat/domain/entities/message.dart';
import 'package:flutter_app/features/chat/domain/repo/chat_repo.dart';
import 'package:flutter_app/features/core/domain/entities/result.dart';
import 'package:hive_ce/hive.dart';

import '../../../../dummy/dummy_data.dart';
import '../../../../shared/constraints/hive_constraints.dart';

final class HiveChatRepo implements ChatRepoFacade {
  final _streamController = StreamController<Message>.broadcast();

  @override
  Future<Result<List<ChatThread>>> getChats() async {
    try {
      final box = Hive.box<ChatThread>(HiveBoxes.chatThreads);
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
      final box = Hive.box<Message>(HiveBoxes.messages);
      final messages = box.values.where((m) => m.chatThreadId == chatThreadId);
      return Result.value(messages.toList());
    } catch (e, st) {
      return Result.failed(e, st);
    }
  }

  @override
  Future<Result<void>> sendMessage(Message message) async {
    try {
      // save message
      final messageBox = Hive.box<Message>(HiveBoxes.messages);
      await messageBox.put(message.id, message);

      // update chat thread
      final threadBox = Hive.box<ChatThread>(HiveBoxes.chatThreads);
      final thread = threadBox.get(message.chatThreadId)!;
      await threadBox.put(
        message.chatThreadId,
        thread.copyWith(lastMessage: message),
      );
      await Future.delayed(const Duration(seconds: 1));

      Future.delayed(const Duration(seconds: 2), () {
        _broadcastMessage(message.chatThreadId);
      });
      return Result.value(null);
    } catch (e, st) {
      return Result.failed(e, st);
    }
  }

  _broadcastMessage(String chatThreadId) async {
    log("Broadcasting message for thread: $chatThreadId");
    final threadBox = Hive.box<ChatThread>(HiveBoxes.chatThreads);
    final thread = threadBox.get(chatThreadId);
    if (thread == null) {
      log("Thread not found: $chatThreadId");
      return;
    }

    final newMessage = Message(
      id: faker.guid.guid(),
      text: faker.lorem.sentence(),
      sender: thread.participants
          .where((p) => p.id != authUser.id)
          .elementAt(
            faker.randomGenerator.integer(thread.participants.length - 2),
          ),
      chatThreadId: chatThreadId,
      timestamp: DateTime.now(),
    );

    final messageBox = Hive.box<Message>(HiveBoxes.messages);
    await messageBox.put(newMessage.id, newMessage);

    await threadBox.put(chatThreadId, thread.copyWith(lastMessage: newMessage));

    _streamController.add(newMessage);
  }

  @override
  Future<Result<void>> createChatThread(ChatThread chatThread) async {
    try {
      // create thread
      final threadBox = Hive.box<ChatThread>(HiveBoxes.chatThreads);
      await threadBox.put(chatThread.id, chatThread);

      // create messagex
      final messageBox = Hive.box<Message>(HiveBoxes.messages);
      await messageBox.put(chatThread.lastMessage.id, chatThread.lastMessage);

      _broadcastMessage(chatThread.id);

      return Result.value(null);
    } catch (e, st) {
      return Result.failed(e, st);
    }
  }
}
