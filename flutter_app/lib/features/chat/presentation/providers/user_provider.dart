import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../dummy/dummy_data.dart';
import '../../domain/entities/chat_overview.dart';

part 'user_provider.g.dart';

@riverpod
User myUser(Ref ref) {
  ref.keepAlive();
  return currentUser;
}
