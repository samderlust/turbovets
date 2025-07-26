import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repo/hive_user_repo.dart';
import '../../domain/repo/user_repo_facade.dart';

part 'user_repo_provider.g.dart';

@riverpod
UserRepoFacade userRepo(Ref ref) {
  ref.keepAlive();
  return HiveUserRepo();
}
