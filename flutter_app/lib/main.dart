import 'package:flutter/material.dart';
import 'package:flutter_app/dummy/dummy_data.dart';
import 'package:flutter_app/features/chat/domain/entities/message.dart';
import 'package:flutter_app/features/user/domain/entities/user.dart';
import 'package:flutter_app/shared/router/app_router.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'features/chat/domain/entities/chat_thread.dart';
import 'features/core/presentation/providers/theme_mode_provider.dart';
import 'shared/constraints/hive_constraints.dart';

final uuid = Uuid();
late SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await _registerHiveAdapters();

  await _initDummyDataToHive();

  sharedPref = await SharedPreferences.getInstance();

  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeSwicherProvider);
    return MaterialApp.router(
      title: 'TurboVest',
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          // titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      routerConfig: appRouter,
    );
  }
}

Future<void> _registerHiveAdapters() async {
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ChatThreadAdapter());
  Hive.registerAdapter(MessageAdapter());
}

Future<void> _initDummyDataToHive() async {
  final userBox = await Hive.openBox<User>(HiveBoxes.users);
  // check if there is any written users
  // we populate users for demo purpose
  if (userBox.isEmpty) {
    await userBox.addAll(fakeUsers);
    await userBox.put(authUser.id, authUser);
  }
}
