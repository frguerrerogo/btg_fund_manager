import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

/// Controller for managing theme mode state.
@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeMode build() => ThemeMode.dark;

  /// Toggle between light and dark theme.
  void toggle() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  /// Set theme to dark mode.
  void setDark() {
    state = ThemeMode.dark;
  }

  /// Set theme to light mode.
  void setLight() {
    state = ThemeMode.light;
  }

  /// Set theme to system preference.
  void setSystem() {
    state = ThemeMode.system;
  }
}
