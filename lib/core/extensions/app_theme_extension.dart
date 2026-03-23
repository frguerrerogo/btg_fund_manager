import 'package:btg_funds/core/theme/app_colors.dart';
import 'package:btg_funds/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';

/// Extension on [BuildContext] to access the design system
/// without repeating `Theme.of(context)` in every widget.
///
/// **Example:**
/// ```dart
/// // Colors
/// context.colors.primary
/// context.colors.surface
/// context.colors.onSurfaceVariant
///
/// // Typography
/// context.textTheme.titleLarge
/// context.textTheme.bodyMedium
///
/// // Complete theme
/// context.theme
/// context.isDark
/// context.isLight
///
/// // Responsive
/// context.isWide
/// context.isExtended
/// ```

extension AppThemeExtension on BuildContext {
  //* THEME
  /// Retrieves the current [ThemeData] from the context.
  ThemeData get theme => Theme.of(this);

  /// Returns `true` if the current theme is dark.
  bool get isDark => theme.brightness == Brightness.dark;

  /// Returns `true` if the current theme is light.
  bool get isLight => theme.brightness == Brightness.light;

  //* COLORS
  /// Retrieves the application color palette.
  ///
  /// Returns [AppColorScheme.dark] if the theme is dark,
  /// or [AppColorScheme.light] if the theme is light.
  AppColors get colors => isDark ? AppColorScheme.dark : AppColorScheme.light;

  /// Retrieves the Material [ColorScheme].
  ///
  /// Useful for widgets that require it internally.
  ColorScheme get colorScheme => theme.colorScheme;

  //* TYPOGRAPHY
  /// Retrieves the typography scheme of the current theme.
  TextTheme get textTheme => theme.textTheme;

  //* RESPONSIVE BREAKPOINTS
  /// The minimum width for tablet/wide layout (600pt).
  static const double _breakpointWide = 600;

  /// The minimum width for extended/large layout (1200pt).
  static const double _breakpointExtended = 1200;

  /// Returns `true` if the screen width is >= 600pt (tablet/wide layout).
  bool get isWide {
    return MediaQuery.sizeOf(this).width >= _breakpointWide;
  }

  /// Returns `true` if the screen width is >= 1200pt (extended/large layout).
  bool get isExtended {
    return MediaQuery.sizeOf(this).width >= _breakpointExtended;
  }

  /// Returns the current screen width.
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// Returns the current screen height.
  double get screenHeight => MediaQuery.sizeOf(this).height;

  //* DESIGN SPACING SHORTCUTS
  /// Standard horizontal padding for screens.
  double get screenPaddingH => AppSpacing.screenHorizontal;

  /// Standard vertical padding for screens.
  double get screenPaddingV => AppSpacing.screenVertical;

  /// Standard gap between list items.
  double get itemGap => AppSpacing.itemGap;

  /// Standard gap between inline elements.
  double get inlineGap => AppSpacing.inlineGap;
}
