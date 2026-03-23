import 'package:flutter/material.dart';

/// Typographic system based on Material 3 TextTheme.
/// Use these styles directly or access them via Theme.of(context).textTheme.
abstract class AppTextStyles {
  AppTextStyles._();

  //* FONT FAMILY
  static const String _fontFamily = 'Inter';

  //* SCALE SIZES
  static const double _displayLargeSize = 57;
  static const double _displayMediumSize = 45;
  static const double _displaySmallSize = 36;

  static const double _headlineLargeSize = 32;
  static const double _headlineMediumSize = 28;
  static const double _headlineSmallSize = 24;

  static const double _titleLargeSize = 22;
  static const double _titleMediumSize = 16;
  static const double _titleSmallSize = 14;

  static const double _bodyLargeSize = 16;
  static const double _bodyMediumSize = 14;
  static const double _bodySmallSize = 12;

  static const double _labelLargeSize = 14;
  static const double _labelMediumSize = 12;
  static const double _labelSmallSize = 11;

  /// Returns the Material 3 TextTheme configured with the app's typography system.
  ///
  /// This theme includes all standard Material text styles (display, headline, title, body, and label)
  /// with the Inter font family and appropriate sizing, weights, letter spacing, and line heights.
  /// Pass this to the MaterialApp's theme property for consistent typography throughout the app.
  static TextTheme get textTheme => const TextTheme(
    // Display — heroes, splash screens
    displayLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _displayLargeSize,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.25,
      height: 1.12,
    ),
    displayMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _displayMediumSize,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      height: 1.16,
    ),
    displaySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _displaySmallSize,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.22,
    ),

    // Headline — large section titles
    headlineLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _headlineLargeSize,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _headlineMediumSize,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.25,
      height: 1.29,
    ),
    headlineSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _headlineSmallSize,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.33,
    ),

    // Title — card headers, lists, app bar
    titleLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _titleLargeSize,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.27,
    ),
    titleMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _titleMediumSize,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      height: 1.50,
    ),
    titleSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _titleSmallSize,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
    ),

    // Body — main reading text
    bodyLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _bodyLargeSize,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.50,
    ),
    bodyMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _bodyMediumSize,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.43,
    ),
    bodySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _bodySmallSize,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.33,
    ),

    // Label — buttons, chips, inputs, metadata
    labelLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _labelLargeSize,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
    ),
    labelMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _labelMediumSize,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.33,
    ),
    labelSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _labelSmallSize,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.45,
    ),
  );

  //* FREQUENTLY USED HELPERS
  /// Returns the display large text style from the current theme.
  static TextStyle? displayLarge(BuildContext context) => Theme.of(context).textTheme.displayLarge;

  /// Returns the headline medium text style from the current theme.
  static TextStyle? headlineMedium(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium;

  /// Returns the title large text style from the current theme.
  static TextStyle? titleLarge(BuildContext context) => Theme.of(context).textTheme.titleLarge;

  /// Returns the title medium text style from the current theme.
  static TextStyle? titleMedium(BuildContext context) => Theme.of(context).textTheme.titleMedium;

  /// Returns the body large text style from the current theme.
  static TextStyle? bodyLarge(BuildContext context) => Theme.of(context).textTheme.bodyLarge;

  /// Returns the body medium text style from the current theme.
  static TextStyle? bodyMedium(BuildContext context) => Theme.of(context).textTheme.bodyMedium;

  /// Returns the body small text style from the current theme.
  static TextStyle? bodySmall(BuildContext context) => Theme.of(context).textTheme.bodySmall;

  /// Returns the label large text style from the current theme.
  static TextStyle? labelLarge(BuildContext context) => Theme.of(context).textTheme.labelLarge;

  /// Returns the label small text style from the current theme.
  static TextStyle? labelSmall(BuildContext context) => Theme.of(context).textTheme.labelSmall;
}
