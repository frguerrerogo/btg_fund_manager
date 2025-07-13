import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static ColorScheme _colors(BuildContext context) => Theme.of(context).colorScheme;
  static TextStyle headlineMedium(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      color: _colors(context).primary,
      letterSpacing: 1.5,
    );
  }

  static TextStyle titleLarge(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: _colors(context).primary,
      letterSpacing: 1.5,
    );
  }

  static TextStyle titleMedium(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: _colors(context).primary,
      letterSpacing: 1.2,
    );
  }

  static TextStyle titleSmall(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: _colors(context).primary,
      letterSpacing: 1.0,
    );
  }

  static TextStyle bodyLarge(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: _colors(context).onSurface,
      letterSpacing: 0.5,
    );
  }

  static TextStyle bodyMedium(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: _colors(context).onSurface,
      letterSpacing: 0.5,
    );
  }

  static TextStyle bodySmall(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: _colors(context).onSurface,
      letterSpacing: 0.5,
    );
  }

  static TextStyle textButton(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 0.5,
    );
  }

  static TextStyle errorText(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.red,
      letterSpacing: 0.5,
    );
  }
}
