import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../dummy/dummy_data.dart';
import '../../../user/domain/entities/user.dart';

part 'user_provider.g.dart';

@riverpod
User myUser(Ref ref) {
  ref.keepAlive();
  return authUser;
}
