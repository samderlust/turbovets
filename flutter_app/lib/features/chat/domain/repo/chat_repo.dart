import 'package:flutter_app/features/chat/domain/entities/chat_thread.dart';
import 'package:flutter_app/features/chat/domain/entities/message.dart';

import '../../../core/domain/entities/result.dart';

abstract interface class ChatRepoFacade {
  /// Send a message to a chat thread
  Future<Result<void>> sendMessage(Message message);

  /// Get all chat threads
  Future<Result<List<ChatThread>>> getChats();

  /// Get all messages for a chat thread
  Future<Result<List<Message>>> getMessages(String chatThreadId);

  /// Message stream for a specific chat thread
  ///
  /// when ever other participant send a message, it will be emitted
  Stream<Message> getMessageStream(String chatThreadId);

  /// Chat thread stream
  ///
  /// emit when a new chat thread is added or updated
  Stream<ChatThread> getChatThreadStream();

  /// Create a new chat thread
  Future<Result<void>> createChatThread(ChatThread chatThread);
}
