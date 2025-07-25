import 'package:flutter_app/features/chat/domain/entities/message.dart';

enum MessageStatus {
  sending,
  sent,
  failed,
  done;

  bool get isSending => this == MessageStatus.sending;
  bool get isSent => this == MessageStatus.sent;
  bool get isFailed => this == MessageStatus.failed;
  bool get isDone => this == MessageStatus.done;
}

class MessageViewModel {
  final Message message;
  final MessageStatus status;

  MessageViewModel({required this.message, this.status = MessageStatus.done});

  MessageViewModel copyWith({Message? message, MessageStatus? status}) {
    return MessageViewModel(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
