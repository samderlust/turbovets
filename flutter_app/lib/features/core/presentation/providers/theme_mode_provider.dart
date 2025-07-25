import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_provider.g.dart';

@riverpod
class ThemeSwicher extends _$ThemeSwicher {
  @override
  ThemeMode build() {
    return ThemeMode.light;
  }

  void toggleThemeMode() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
