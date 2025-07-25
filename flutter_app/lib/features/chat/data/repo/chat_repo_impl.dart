import 'dart:async';
import 'dart:developer';

import 'package:flutter_app/features/chat/domain/entities/chat_overview.dart';
import 'package:flutter_app/features/chat/domain/entities/message.dart';
import 'package:flutter_app/features/chat/domain/repo/chat_repo.dart';
import 'package:flutter_app/features/core/domain/entities/result.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/shared/constraints/current_user.dart';

final fakeUsers = faker.randomGenerator.amount(
  (i) {
    return User(
      id: faker.guid.guid(),
      name: faker.person.name(),
      avatarUrl: faker.image.loremPicsum(seed: "avatar,person,$i", random: i),
    );
  },
  20,
  min: 10,
);

final fakeChatThreads = faker.randomGenerator.amount(
  (_) {
    final participants = faker.randomGenerator.amount(
      (_) => fakeUsers[faker.randomGenerator.integer(fakeUsers.length)],
      4,
      min: 1,
    )..add(currentUser);

    return ChatThread(
      id: faker.guid.guid(),
      lastMessage: Message(
        id: faker.guid.guid(),
        text: faker.lorem.sentence(),
        sender: fakeUsers[faker.randomGenerator.integer(fakeUsers.length)],
        chatThreadId: faker.guid.guid(),
        timestamp: DateTime.now().subtract(
          Duration(minutes: faker.randomGenerator.integer(60)),
        ),
      ),
      participants: participants,
    );
  },
  20,
  min: 10,
);

final fakeMessages = fakeChatThreads.fold<List<Message>>([], (list, thread) {
  final messages = thread.participants.fold<List<Message>>([], (
    msgList,
    participant,
  ) {
    final items = faker.randomGenerator.amount(
      (_) {
        return Message(
          id: faker.guid.guid(),
          text: faker.lorem.sentence(),
          sender: participant,
          chatThreadId: thread.id,
          timestamp: DateTime.now().subtract(
            Duration(minutes: faker.randomGenerator.integer(60)),
          ),
        );
      },
      8,
      min: 3,
    );

    return msgList..addAll(items);
  });

  return list
    ..addAll(messages)
    ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
});

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
    log("Broadcasting message for thread: $chatThreadId");
    final thread = fakeChatThreads.firstWhere((t) => t.id == chatThreadId);
    final newMessage = Message(
      id: faker.guid.guid(),
      text: faker.lorem.sentence(),
      sender: thread.participants
          .where((p) => p.id != currentUser.id)
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
}
