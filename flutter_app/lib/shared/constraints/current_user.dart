import '../../features/chat/domain/entities/chat_overview.dart';
import '../../main.dart';

final currentUser = User(
  id: faker.guid.guid(),
  name: "Sam",
  avatarUrl: faker.image.loremPicsum(seed: "avatar, person", random: 83123123),
);
