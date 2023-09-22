import 'package:flutter/material.dart';
import 'package:flutterpractic/core/theme/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_context.g.dart';

@riverpod
class ColorTheme extends _$ColorTheme {
  @override
  int build() {
    return 0;
  }

  void toggleTheme(int theme) {
    if (theme < colorThemes.length - 1) {
      state = theme;
    }
  }
}

@riverpod
class DarkTheme extends _$DarkTheme {
  @override
  bool build() {
    return false;
  }

  void toggleDark() {
    state = !state;
  }
}
