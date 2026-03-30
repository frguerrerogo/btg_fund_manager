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
/// context.isMobile     // < 600pt
/// context.isTablet     // >= 600pt && < 1200pt
/// context.isDesktop    // >= 1200pt
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
  /// The minimum width for tablet layout (600pt).
  static const double _breakpointTablet = 600;

  /// The minimum width for desktop layout (1200pt).
  static const double _breakpointDesktop = 1200;

  /// Returns `true` if the screen width is < 600pt (mobile device).
  bool get isMobile {
    return MediaQuery.sizeOf(this).width < _breakpointTablet;
  }

  /// Returns `true` if the screen width is >= 600pt and < 1200pt (tablet device).
  bool get isTablet {
    final width = MediaQuery.sizeOf(this).width;
    return width >= _breakpointTablet && width < _breakpointDesktop;
  }

  /// Returns `true` if the screen width is >= 1200pt (desktop device).
  bool get isDesktop {
    return MediaQuery.sizeOf(this).width >= _breakpointDesktop;
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
