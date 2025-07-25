import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/core/presentation/providers/theme_mode_provider.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeSwicherProvider);
    return Switch(
      value: themeMode == ThemeMode.dark,
      onChanged: (_) {
        ref.read(themeSwicherProvider.notifier).toggleThemeMode();
      },
      activeThumbImage: const AssetImage('assets/moon.png'),
      inactiveThumbImage: const AssetImage('assets/sun.png'),
    );
  }
}
