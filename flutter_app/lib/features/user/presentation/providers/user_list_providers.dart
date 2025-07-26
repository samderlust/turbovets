import '''
package:flutter_app/features/core/domain/entities/result.dart''';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/user.dart';
import 'user_repo_provider.dart';

part 'user_list_providers.g.dart';

@riverpod
Future<List<User>> userList(Ref ref) async {
  final res = await ref.read(userRepoProvider).getUsers();
  return res.when(
    value: (value) {
      ref.keepAlive();
      return value;
    },
    failed: (error, st) => throw error,
  );
}
