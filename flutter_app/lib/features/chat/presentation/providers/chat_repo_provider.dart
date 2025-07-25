import 'package:flutter_app/features/chat/data/repo/chat_repo_impl.dart';
import 'package:flutter_app/features/chat/domain/repo/chat_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_repo_provider.g.dart';

@riverpod
ChatRepoFacade chatRepo(Ref ref) {
  return ChatRepoImpl();
}
