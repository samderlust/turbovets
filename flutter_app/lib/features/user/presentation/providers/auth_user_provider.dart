import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/domain/entities/result.dart';
import '../../domain/entities/user.dart';
import 'user_repo_provider.dart';

part 'auth_user_provider.g.dart';

@riverpod
Future<User> authUser(Ref ref) async {
  final res = await ref.read(userRepoProvider).getAuthUser();
  return res.when(value: (value) => value, failed: (error, st) => throw error);
}
