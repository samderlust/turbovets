import 'package:flutter_app/features/chat/domain/entities/message.dart';

enum MessageStatus { sending, sent, failed, done }

class MessageViewModel {
  final Message message;
  final MessageStatus status;

  MessageViewModel({
    required this.message,
    this.status = MessageStatus.sending,
  });

  MessageViewModel copyWith({Message? message, MessageStatus? status}) {
    return MessageViewModel(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
