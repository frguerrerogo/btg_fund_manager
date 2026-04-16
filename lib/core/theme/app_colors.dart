import 'package:flutter/material.dart';

/// Primitive color palette (design tokens).
///
/// Never use these directly in widgets. Instead, use [AppColorScheme] which
/// provides semantically named colors appropriate for light and dark modes.
abstract class AppPalette {
  //* SEED COLOR FOR MATERIAL 3
  /// Seed color for generating Material 3 color schemes (#074F3B)
  static const seedColor = Color.fromARGB(255, 7, 80, 59);

  /// Neutral color token 0 (pure white).
  static const neutral0 = Color(0xFFFFFFFF);

  /// Neutral color token 950 (near black).
  static const neutral950 = Color(0xFF0A0A0A);

  // Success — Green
  /// Success color shade 50.
  static const success50 = Color(0xFFDCFCE7);

  /// Success color shade 200.
  static const success200 = Color(0xFF86EFAC);

  /// Success color shade 400.
  static const success400 = Color(0xFF4ADE80);

  /// Success color shade 500.
  static const success500 = Color(0xFF22C55E);

  /// Success color shade 700.
  static const success700 = Color(0xFF15803D);

  /// Success color shade 900.
  static const success900 = Color(0xFF14532D);

  // Warning — Yellow
  /// Warning color shade 50.
  static const warning50 = Color(0xFFFEF9C3);

  /// Warning color shade 200.
  static const warning200 = Color(0xFFFDE68A);

  /// Warning color shade 400.
  static const warning400 = Color(0xFFFBBF24);

  /// Warning color shade 500.
  static const warning500 = Color(0xFFEAB308);

  /// Warning color shade 700.
  static const warning700 = Color(0xFFA16207);

  /// Warning color shade 900.
  static const warning900 = Color(0xFF713F12);

  // Error — Red
  /// Error color shade 50.
  static const error50 = Color(0xFFFEE2E2);

  /// Error color shade 200.
  static const error200 = Color(0xFFFCA5A5);

  /// Error color shade 400.
  static const error400 = Color(0xFFF87171);

  /// Error color shade 500.
  static const error500 = Color(0xFFEF4444);

  /// Error color shade 700.
  static const error700 = Color(0xFFB91C1C);

  /// Error color shade 900.
  static const error900 = Color(0xFF7F1D1D);

  // Info — Sky blue
  /// Info color shade 50.
  static const info50 = Color(0xFFE0F2FE);

  /// Info color shade 200.
  static const info200 = Color(0xFF7DD3FC);

  /// Info color shade 400.
  static const info400 = Color(0xFF38BDF8);

  /// Info color shade 500.
  static const info500 = Color(0xFF0EA5E9);

  /// Info color shade 700.
  static const info700 = Color(0xFF0369A1);

  /// Info color shade 900.
  static const info900 = Color(0xFF0C4A6E);
}

/// Semantic color scheme ready to use in widgets.
///
/// Provides two complete color schemes: [light] for light mode and [dark] for dark mode.
/// Extend this class if you need app-specific color tokens.
class AppColorScheme {
  const AppColorScheme._();

  /// Light mode color scheme.
  static const AppColors light = AppColors(
    success: AppPalette.success500,
    successContainer: AppPalette.success50,
    onSuccess: AppPalette.neutral0,

    warning: AppPalette.warning500,
    warningContainer: AppPalette.warning50,
    onWarning: AppPalette.neutral0,

    error: AppPalette.error500,
    errorContainer: AppPalette.error50,
    onError: AppPalette.neutral0,

    info: AppPalette.info500,
    infoContainer: AppPalette.info50,
    onInfo: AppPalette.neutral0,
  );

  /// Dark mode color scheme.
  static const AppColors dark = AppColors(
    success: AppPalette.success400,
    successContainer: AppPalette.success900,
    onSuccess: AppPalette.neutral950,

    warning: AppPalette.warning400,
    warningContainer: AppPalette.warning900,
    onWarning: AppPalette.neutral950,

    error: AppPalette.error400,
    errorContainer: AppPalette.error900,
    onError: AppPalette.neutral950,

    info: AppPalette.info400,
    infoContainer: AppPalette.info900,
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
