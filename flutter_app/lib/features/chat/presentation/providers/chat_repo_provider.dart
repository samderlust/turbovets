import 'package:flutter_app/features/chat/domain/repo/chat_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repo/hive_chat_repo.dart';

part 'chat_repo_provider.g.dart';

@riverpod
ChatRepoFacade chatRepo(Ref ref) {
  final repo = HiveChatRepo();
  ref.onDispose(() {
    repo.dispose();
  });
  ref.keepAlive();
  return repo;
}
