import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/shared/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final faker = Faker();
void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TurboVest',
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
