import 'package:faker/faker.dart';

import '../features/chat/domain/entities/chat_thread.dart';
import '../features/chat/domain/entities/message.dart';
import '../features/user/domain/entities/user.dart';

final faker = Faker();

final authUser = User(
  id: 'auth_user_123_098',
  name: "Sam",
  avatarUrl: faker.image.loremPicsum(seed: "avatar, person", random: 83123123),
);

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
    )..add(authUser);

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
