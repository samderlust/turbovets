import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../main.dart';

part 'theme_mode_provider.g.dart';

@riverpod
class ThemeSwicher extends _$ThemeSwicher {
  @override
  ThemeMode build() {
    if (sharedPref.getBool('isDarkMode') ?? false) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  void toggleThemeMode() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    sharedPref.setBool('isDarkMode', state == ThemeMode.dark);
  }
}
