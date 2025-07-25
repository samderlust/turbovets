import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/shared/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'features/core/presentation/providers/theme_mode_provider.dart';

final faker = Faker();
final uuid = Uuid();
void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeSwicherProvider);
    return MaterialApp.router(
      title: 'TurboVest',
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        disabledColor: Colors.grey,
        appBarTheme: const AppBarTheme(
          // titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      routerConfig: appRouter,
    );
  }
}
