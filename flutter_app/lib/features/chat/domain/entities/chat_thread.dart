import 'package:flutter_app/features/chat/domain/entities/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

import '../../../user/domain/entities/user.dart';

part 'chat_thread.freezed.dart';
part 'chat_thread.g.dart';

@HiveType(typeId: 0)
@freezed
sealed class ChatThread with _$ChatThread {
  factory ChatThread({
    @HiveField(0) required String id,
    @HiveField(1) required Message lastMessage,
    @HiveField(2) required List<User> participants,
  }) = _ChatThread;

  factory ChatThread.fromJson(Map<String, dynamic> json) =>
      _$ChatThreadFromJson(json);
}
