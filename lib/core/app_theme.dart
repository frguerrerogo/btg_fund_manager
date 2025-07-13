import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final Color? selectedColor;
  final bool? isDarkmode;

  AppTheme({this.selectedColor = Colors.blue, this.isDarkmode = false});

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: selectedColor,
    textTheme: GoogleFonts.interTextTheme(),
    brightness: isDarkmode! ? Brightness.dark : Brightness.light,
  );

  AppTheme copyWith({Color? selectedColor, bool? isDarkmode}) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkmode: isDarkmode ?? this.isDarkmode,
  );
}
