import 'package:flutter/material.dart';

/// Primitive color palette (design tokens).
///
/// Never use these directly in widgets. Instead, use [AppColorScheme] which
/// provides semantically named colors appropriate for light and dark modes.
abstract class AppPalette {
  //* BRAND
  /// Lightest primary shade (50)
  static const primary50 = Color(0xFFEEF2FF);

  /// Primary shade (100)
  static const primary100 = Color(0xFFE0E7FF);

  /// Primary shade (200)
  static const primary200 = Color(0xFFC7D2FE);

  /// Primary shade (300)
  static const primary300 = Color(0xFFA5B4FC);

  /// Primary shade (400)
  static const primary400 = Color(0xFF818CF8);

  /// Primary brand color (500) - Main brand color
  static const primary500 = Color(0xFF6366F1);

  /// Primary shade (600)
  static const primary600 = Color(0xFF4F46E5);

  /// Primary shade (700)
  static const primary700 = Color(0xFF4338CA);

  /// Primary shade (800)
  static const primary800 = Color(0xFF3730A3);

  /// Darkest primary shade (900)
  static const primary900 = Color(0xFF312E81);

  //* NEUTRALS
  /// Pure white
  static const neutral0 = Color(0xFFFFFFFF);

  /// Neutral shade (50)
  static const neutral50 = Color(0xFFF8FAFC);

  /// Neutral shade (100)
  static const neutral100 = Color(0xFFF1F5F9);

  /// Neutral shade (200)
  static const neutral200 = Color(0xFFE2E8F0);

  /// Neutral shade (300)
  static const neutral300 = Color(0xFFCBD5E1);

  /// Neutral shade (400)
  static const neutral400 = Color(0xFF94A3B8);

  /// Neutral shade (500)
  static const neutral500 = Color(0xFF64748B);

  /// Neutral shade (600)
  static const neutral600 = Color(0xFF475569);

  /// Neutral shade (700)
  static const neutral700 = Color(0xFF334155);

  /// Neutral shade (800)
  static const neutral800 = Color(0xFF1E293B);

  /// Neutral shade (900)
  static const neutral900 = Color(0xFF0F172A);

  /// Darkest neutral shade (950)
  static const neutral950 = Color(0xFF020617);

  //* SEMANTIC
  /// Success color (400) - Light variant
  static const success400 = Color(0xFF4ADE80);

  /// Success color (500) - Main variant
  static const success500 = Color(0xFF22C55E);

  /// Success color (600) - Dark variant
  static const success600 = Color(0xFF16A34A);

  /// Warning color (400) - Light variant
  static const warning400 = Color(0xFFFBBF24);

  /// Warning color (500) - Main variant
  static const warning500 = Color(0xFFF59E0B);

  /// Warning color (600) - Dark variant
  static const warning600 = Color(0xFFD97706);

  /// Error color (400) - Light variant
  static const error400 = Color(0xFFF87171);

  /// Error color (500) - Main variant
  static const error500 = Color(0xFFEF4444);

  /// Error color (600) - Dark variant
  static const error600 = Color(0xFFDC2626);

  /// Info color (400) - Light variant
  static const info400 = Color(0xFF38BDF8);

  /// Info color (500) - Main variant
  static const info500 = Color(0xFF0EA5E9);

  /// Info color (600) - Dark variant
  static const info600 = Color(0xFF0284C7);
}

/// Semantic color scheme ready to use in widgets.
///
/// Provides two complete color schemes: [light] for light mode and [dark] for dark mode.
/// Extend this class if you need app-specific color tokens.
abstract class AppColorScheme {
  const AppColorScheme._();

  /// Light mode color scheme.
  static const AppColors light = AppColors(
    // Brand
    primary: AppPalette.primary500,
    primaryLight: AppPalette.primary100,
    primaryDark: AppPalette.primary700,
    onPrimary: AppPalette.neutral0,

    // Backgrounds
    background: AppPalette.neutral50,
    surface: AppPalette.neutral0,
    surfaceVariant: AppPalette.neutral100,
    overlay: AppPalette.neutral200,

    // Content
    onBackground: AppPalette.neutral900,
    onSurface: AppPalette.neutral900,
    onSurfaceVariant: AppPalette.neutral600,
    placeholder: AppPalette.neutral400,
    disabled: AppPalette.neutral300,

    // Borders
    border: AppPalette.neutral200,
    borderFocused: AppPalette.primary500,
    divider: AppPalette.neutral100,

    // Semantic
    success: AppPalette.success500,
    successContainer: Color(0xFFDCFCE7),
    onSuccess: AppPalette.neutral0,

    warning: AppPalette.warning500,
    warningContainer: Color(0xFFFEF9C3),
    onWarning: AppPalette.neutral0,

    error: AppPalette.error500,
    errorContainer: Color(0xFFFEE2E2),
    onError: AppPalette.neutral0,

    info: AppPalette.info500,
    infoContainer: Color(0xFFE0F2FE),
    onInfo: AppPalette.neutral0,
  );

  /// Dark mode color scheme.
  static const AppColors dark = AppColors(
    // Brand
    primary: AppPalette.primary400,
    primaryLight: AppPalette.primary900,
    primaryDark: AppPalette.primary300,
    onPrimary: AppPalette.neutral950,

    // Backgrounds
    background: AppPalette.neutral950,
    surface: AppPalette.neutral900,
    surfaceVariant: AppPalette.neutral800,
    overlay: AppPalette.neutral700,

    // Content
    onBackground: AppPalette.neutral50,
    onSurface: AppPalette.neutral50,
    onSurfaceVariant: AppPalette.neutral400,
    placeholder: AppPalette.neutral600,
    disabled: AppPalette.neutral700,

    // Borders
    border: AppPalette.neutral700,
    borderFocused: AppPalette.primary400,
    divider: AppPalette.neutral800,

    // Semantic
    success: AppPalette.success400,
    successContainer: Color(0xFF14532D),
    onSuccess: AppPalette.neutral950,

    warning: AppPalette.warning400,
    warningContainer: Color(0xFF713F12),
    onWarning: AppPalette.neutral950,

    error: AppPalette.error400,
    errorContainer: Color(0xFF7F1D1D),
    onError: AppPalette.neutral950,

    info: AppPalette.info400,
    infoContainer: Color(0xFF0C4A6E),
    onInfo: AppPalette.neutral950,
  );
}

/// Immutable class containing all semantic colors for the application.
///
/// This class holds color definitions for all UI elements across light and dark modes.
/// Use instances from [AppColorScheme] rather than creating new instances.
class AppColors {
  /// Creates a new AppColors instance with all required semantic colors.
  ///
  /// All parameters are required. Use [AppColorScheme.light] or [AppColorScheme.dark]
  /// instead of creating instances directly.
  const AppColors({
    required this.primary,
    required this.primaryLight,
    required this.primaryDark,
    required this.onPrimary,
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.overlay,
    required this.onBackground,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.placeholder,
    required this.disabled,
    required this.border,
    required this.borderFocused,
    required this.divider,
    required this.success,
    required this.successContainer,
    required this.onSuccess,
    required this.warning,
    required this.warningContainer,
    required this.onWarning,
    required this.error,
    required this.errorContainer,
    required this.onError,
    required this.info,
    required this.infoContainer,
    required this.onInfo,
  });

  /// Primary brand color
  final Color primary;

  /// Light variant of primary color
  final Color primaryLight;

  /// Dark variant of primary color
  final Color primaryDark;

  /// Color for text/content on primary background
  final Color onPrimary;

  /// Main background color
  final Color background;

  /// Surface color for cards, sheets, etc.
  final Color surface;

  /// Secondary surface color for nested elements
  final Color surfaceVariant;

  /// Overlay color for modals, dialogs
  final Color overlay;

  /// Text color on background
  final Color onBackground;

  /// Text color on surface
  final Color onSurface;

  /// Secondary text color on surface
  final Color onSurfaceVariant;

  /// Placeholder color for inputs
  final Color placeholder;

  /// Color for disabled elements
  final Color disabled;

  /// Border color for inputs and dividers
  final Color border;

  /// Border color when focused
  final Color borderFocused;

  /// Divider line color
  final Color divider;

  /// Success semantic color
  final Color success;

  /// Success container background
  final Color successContainer;

  /// Text color on success background
  final Color onSuccess;

  /// Warning semantic color
  final Color warning;

  /// Warning container background
  final Color warningContainer;

  /// Text color on warning background
  final Color onWarning;

  /// Error semantic color
  final Color error;

  /// Error container background
  final Color errorContainer;

  /// Text color on error background
  final Color onError;

  /// Info semantic color
  final Color info;

  /// Info container background
  final Color infoContainer;

  /// Text color on info background
  final Color onInfo;
}
