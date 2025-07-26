import '../../domain/entities/chat_thread.dart';

class ChatThreadViewModel {
  final ChatThread thread;
  final bool hasNewMessages;

  ChatThreadViewModel({required this.thread, required this.hasNewMessages});

  ChatThreadViewModel copyWith({ChatThread? thread, bool? hasNewMessages}) {
    return ChatThreadViewModel(
      thread: thread ?? this.thread,
      hasNewMessages: hasNewMessages ?? this.hasNewMessages,
    );
  }
}
