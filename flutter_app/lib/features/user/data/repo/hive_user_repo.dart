import 'package:hive_ce/hive.dart';

import '../../../../dummy/dummy_data.dart';
import '../../../../shared/constraints/hive_constraints.dart';
import '../../../core/domain/entities/result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repo/user_repo_facade.dart';

final class HiveUserRepo implements UserRepoFacade {
  @override
  Future<Result<User>> getAuthUser() async {
    try {
      final box = Hive.box<User>(HiveBoxes.users);
      final user = box.get(authUser.id);
      return Result.value(user!);
    } catch (e, st) {
      return Result.failed(e, st);
    }
  }

  @override
  Future<Result<List<User>>> getUsers() async {
    try {
      final box = Hive.box<User>(HiveBoxes.users);
      final users = box.values.toList();
      return Result.value(users.where((u) => u.id != authUser.id).toList());
    } catch (e, st) {
      return Result.failed(e, st);
    }
  }
}
