import 'package:flutter_app/features/chat/domain/entities/message.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_overview.freezed.dart';
part 'chat_overview.g.dart';

@freezed
sealed class ChatThread with _$ChatThread {
  factory ChatThread({
    required String id,
    required Message lastMessage,
    required List<User> participants,
  }) = _ChatThread;

  factory ChatThread.fromJson(Map<String, dynamic> json) =>
      _$ChatThreadFromJson(json);
}

@freezed
sealed class User with _$User {
  factory User({
    required String id,
    required String name,
    required String avatarUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
