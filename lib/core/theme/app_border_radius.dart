import 'package:flutter/material.dart';

/// Consistent border radius system for the entire application.
///
/// Provides scalar values, BorderRadius objects, and semantic aliases for common components.
/// All corner rounding should use values from this class for visual consistency.
abstract class AppBorderRadius {
  AppBorderRadius._();

  //* SCALAR VALUES
  /// No rounding
  static const double none = 0;

  /// Extra small rounding - 4pt
  static const double xs = 4;

  /// Small rounding - 8pt
  static const double sm = 8;

  /// Medium rounding - 12pt
  static const double md = 12;

  /// Large rounding - 16pt
  static const double lg = 16;

  /// Extra large rounding - 20pt
  static const double xl = 20;

  /// 2x extra large rounding - 24pt
  static const double xl2 = 24;

  /// 3x extra large rounding - 32pt
  static const double xl3 = 32;

  /// Full rounding - 999pt (pill shape / circle)
  static const double full = 999;

  //* BORDER RADIUS OBJECTS
  /// No border radius
  static const BorderRadius brNone = BorderRadius.zero;

  /// Extra small border radius
  static const BorderRadius brXs = BorderRadius.all(Radius.circular(xs));

  /// Small border radius
  static const BorderRadius brSm = BorderRadius.all(Radius.circular(sm));

  /// Medium border radius
  static const BorderRadius brMd = BorderRadius.all(Radius.circular(md));

  /// Large border radius
  static const BorderRadius brLg = BorderRadius.all(Radius.circular(lg));

  /// Extra large border radius
  static const BorderRadius brXl = BorderRadius.all(Radius.circular(xl));

  /// 2x extra large border radius
  static const BorderRadius brXl2 = BorderRadius.all(Radius.circular(xl2));

  /// 3x extra large border radius
  static const BorderRadius brXl3 = BorderRadius.all(Radius.circular(xl3));

  /// Full border radius (pill shape)
  static const BorderRadius brFull = BorderRadius.all(Radius.circular(full));

  //* SEMANTIC ALIASES
  /// Border radius for chips, badges, tags
  static const BorderRadius chip = brFull;

  /// Border radius for buttons
  static const BorderRadius button = brMd;

  /// Border radius for input fields and text fields
  static const BorderRadius input = brMd;

  /// Border radius for small cards
  static const BorderRadius cardSm = brMd;

  /// Border radius for standard cards
  static const BorderRadius card = brLg;

  /// Border radius for large cards and modals
  static const BorderRadius cardLg = brXl2;

  /// Border radius for bottom sheets (top corners only)
  static BorderRadius bottomSheet = const BorderRadius.only(
    topLeft: Radius.circular(xl2),
    topRight: Radius.circular(xl2),
  );

  /// Border radius for dialogs
  static const BorderRadius dialog = brXl;

  /// Border radius for tooltips and popovers
  static const BorderRadius tooltip = brSm;

  //* BORDER SIDE HELPERS
  /// Creates a [BorderSide] with the specified color and width.
  static BorderSide side({
    required Color color,
    double width = 1.0,
  }) => BorderSide(color: color, width: width);

  /// Creates an [OutlineInputBorder] with the specified color, width, and border radius.
  ///
  /// Defaults to [input] radius and 1.0 width if not provided.
  static OutlineInputBorder inputBorder({
    required Color color,
    double width = 1.0,
    BorderRadius radius = input,
  }) => OutlineInputBorder(
    borderRadius: radius,
    borderSide: BorderSide(color: color, width: width),
  );
}
