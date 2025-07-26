import 'dart:async';
import 'dart:developer';

import 'package:faker/faker.dart';
import 'package:flutter_app/features/chat/domain/entities/chat_thread.dart';
import 'package:flutter_app/features/chat/domain/entities/message.dart';
import 'package:flutter_app/features/chat/domain/repo/chat_repo.dart';
import 'package:flutter_app/features/core/domain/entities/result.dart';

import '../../../../dummy/dummy_data.dart';

class ChatRepoImpl implements ChatRepoFacade {
  final _streamController = StreamController<Message>.broadcast();
  final threads = {for (final thread in fakeChatThreads) thread.id: thread};

  @override
  Future<Result<List<ChatThread>>> getChats() async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));

    // Return the fake chat threads wrapped in a Result
    return Result.value(threads.values.toList());
  }

  @override
  Future<Result<List<Message>>> getMessages(String chatThreadId) {
    // Simulate a network delay
    return Future.delayed(const Duration(seconds: 1), () {
      // Return the fake messages wrapped in a Result
      return Result.value(
        fakeMessages.where((m) => m.chatThreadId == chatThreadId).toList(),
      );
    });
  }

  @override
  Future<Result<void>> sendMessage(Message message) {
    // Simulate a network delay
    return Future.delayed(const Duration(seconds: 1), () {
      // Add the message to the fake messages
      fakeMessages.add(message);

      Future.delayed(const Duration(seconds: 2), () {
        _broadcastMessage(message.chatThreadId);
      });

      // Return a success Result
      return Result.value(null);
      // return Result.failed("failed", StackTrace.current);
    });
  }

  _broadcastMessage(String chatThreadId) {
    final faker = Faker();
    log("Broadcasting message for thread: $chatThreadId");
    final thread = fakeChatThreads.firstWhere((t) => t.id == chatThreadId);
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
    _streamController.add(newMessage);
    fakeMessages.add(newMessage);
  }

  @override
  Stream<Message> getMessageStream(String chatThreadId) {
    log("Setting up stream for thread: $chatThreadId");
    return _streamController.stream.where((m) {
      log("Stream filtering message: ${m.chatThreadId} == $chatThreadId");
      return m.chatThreadId == chatThreadId;
    });
  }

  @override
  Future<Result<void>> createChatThread(ChatThread chatThread) {
    // TODO: implement createChatThread
    throw UnimplementedError();
  }
}
