import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

import '../../../user/domain/entities/user.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@HiveType(typeId: 2)
@freezed
sealed class Message with _$Message {
  factory Message({
    @HiveField(0) required String id,
    @HiveField(1) required String text,
    @HiveField(2) required User sender,
    @HiveField(3) required String chatThreadId,
    @HiveField(4) required DateTime timestamp,
    @HiveField(5) @Default([]) List<String> file,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
