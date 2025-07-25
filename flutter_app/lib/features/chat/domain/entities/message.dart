import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat_overview.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
sealed class Message with _$Message {
  factory Message({
    required String id,
    required String text,
    required User sender,
    required String chatThreadId,
    required DateTime timestamp,
    @Default([]) List<String> file,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
