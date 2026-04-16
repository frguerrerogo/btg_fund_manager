import 'package:btg_funds/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Design system entry point.
/// Generates [ThemeData] for light and dark modes.
///
/// Use in MaterialApp:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
///   themeMode: ThemeMode.system,
/// )
/// ```
abstract class AppTheme {
  AppTheme._();

  /// Theme for light mode.
  ///
  /// Use as `theme:` in [MaterialApp].
  static ThemeData get light => _build(
    brightness: Brightness.light,
    colors: AppColorScheme.light,
    systemOverlay: SystemUiOverlayStyle.dark,
  );

  /// Theme for dark mode.
  ///
  /// Use as `darkTheme:` in [MaterialApp].
  static ThemeData get dark => _build(
    brightness: Brightness.dark,
    colors: AppColorScheme.dark,
    systemOverlay: SystemUiOverlayStyle.light,
  );

  //* BUILDER
  static ThemeData _build({
    required Brightness brightness,
    required AppColors colors,
    required SystemUiOverlayStyle systemOverlay,
  }) {
    // Generate ColorScheme dynamically from seed color
    final seedColorScheme = ColorScheme.fromSeed(
      seedColor: AppPalette.seedColor,
      brightness: brightness,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: 'Inter',
      //* Color scheme - Generated from seed color
      colorScheme: seedColorScheme.copyWith(),
    );
  }
}
