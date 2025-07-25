import 'package:flutter_app/features/chat/domain/entities/chat_overview.dart';
import 'package:flutter_app/features/chat/domain/entities/message.dart';

import '../../../core/domain/entities/result.dart';

abstract interface class ChatRepoFacade {
  Future<Result<void>> sendMessage(Message message);
  Future<Result<List<ChatThread>>> getChats();
  Future<Result<List<Message>>> getMessages(String chatThreadId);
}
