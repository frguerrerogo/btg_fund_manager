import 'package:flutter/material.dart';

/// Shadow system for providing elevation and depth to UI elements.
///
/// Includes preset shadows for common components (cards, modals, buttons)
/// and utility methods for creating custom shadows with brand colors.
abstract class AppShadows {
  AppShadows._();

  //* LIGHT SHADOWS
  /// Small shadow with 5-10% opacity
  static const List<BoxShadow> sm = [
    BoxShadow(
      color: Color(0x0D000000), // 5% opacidad
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
    BoxShadow(
      color: Color(0x1A000000), // 10%
      blurRadius: 2,
      offset: Offset(0, 1),
    ),
  ];

  /// Medium shadow with 5-10% opacity
  static const List<BoxShadow> md = [
    BoxShadow(
      color: Color(0x0D000000),
      blurRadius: 12,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  /// Large shadow with 5-10% opacity
  static const List<BoxShadow> lg = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 24,
      offset: Offset(0, 10),
    ),
    BoxShadow(
      color: Color(0x0D000000),
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ];

  /// Extra large shadow with 15-26% opacity
  static const List<BoxShadow> xl = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 48,
      offset: Offset(0, 20),
    ),
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];

  //* DARK SHADOWS
  /// Small dark shadow with brand color (15% opacity)
  static List<BoxShadow> smDark(Color brandColor) => [
    BoxShadow(
      color: brandColor.withValues(alpha: 0.15),
      blurRadius: 4,
      offset: const Offset(0, 1),
    ),
  ];

  /// Medium dark shadow with brand color (20% opacity)
  static List<BoxShadow> mdDark(Color brandColor) => [
    BoxShadow(
      color: brandColor.withValues(alpha: 0.20),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  //* SPECIFIC SHADOWS
  /// Shadow for floating cards
  static const List<BoxShadow> card = md;

  /// Shadow for bottom sheets and modals
  static const List<BoxShadow> modal = xl;

  /// Shadow for elevated buttons
  static const List<BoxShadow> button = sm;

  /// Shadow for tooltips
  static const List<BoxShadow> tooltip = sm;
}
