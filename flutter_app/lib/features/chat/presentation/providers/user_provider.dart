import 'package:flutter_app/shared/constraints/current_user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/chat_overview.dart';

part 'user_provider.g.dart';

@riverpod
User myUser(Ref ref) {
  ref.keepAlive();
  return currentUser;
}
