import 'package:btg_funds/core/theme/app_border_radius.dart';
import 'package:btg_funds/core/theme/app_colors.dart';
import 'package:btg_funds/core/theme/app_spacing.dart';
import 'package:btg_funds/core/theme/app_text_styles.dart';
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
    final textTheme = AppTextStyles.textTheme;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: 'Inter',
      //* Color scheme
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        primaryContainer: colors.primaryLight,
        onPrimaryContainer: colors.primaryDark,
        secondary: colors.primary,
        onSecondary: colors.onPrimary,
        secondaryContainer: colors.primaryLight,
        onSecondaryContainer: colors.primaryDark,
        tertiary: colors.info,
        onTertiary: colors.onInfo,
        tertiaryContainer: colors.infoContainer,
        onTertiaryContainer: colors.info,
        error: colors.error,
        onError: colors.onError,
        errorContainer: colors.errorContainer,
        onErrorContainer: colors.error,
        surface: colors.surface,
        onSurface: colors.onSurface,
        onSurfaceVariant: colors.onSurfaceVariant,
        outline: colors.border,
        outlineVariant: colors.divider,
        shadow: const Color(0xFF000000),
        scrim: const Color(0xFF000000),
        inverseSurface: colors.onSurface,
        onInverseSurface: colors.surface,
        inversePrimary: colors.primaryDark,
      ),

      //* Scaffold
      scaffoldBackgroundColor: colors.background,

      //* AppBar
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: colors.onSurface,
          fontWeight: FontWeight.w600,
        ),
        systemOverlayStyle: systemOverlay,
        iconTheme: IconThemeData(
          color: colors.onSurface,
          size: AppSpacing.iconLg,
        ),
      ),

      //* TextTheme
      textTheme: textTheme.apply(
        bodyColor: colors.onSurface,
        displayColor: colors.onSurface,
      ),

      //* Card
      cardTheme: CardThemeData(
        elevation: 0,
        color: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.card,
          side: BorderSide(color: colors.border),
        ),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      ),

      //* InputDecoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceVariant,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        border: AppBorderRadius.inputBorder(color: colors.border),
        enabledBorder: AppBorderRadius.inputBorder(color: colors.border),
        focusedBorder: AppBorderRadius.inputBorder(
          color: colors.borderFocused,
          width: AppSpacing.borderWidthFocused,
        ),
        errorBorder: AppBorderRadius.inputBorder(color: colors.error),
        focusedErrorBorder: AppBorderRadius.inputBorder(
          color: colors.error,
          width: AppSpacing.borderWidthFocused,
        ),
        disabledBorder: AppBorderRadius.inputBorder(color: colors.disabled),
        hintStyle: textTheme.bodyMedium?.copyWith(color: colors.placeholder),
        labelStyle: textTheme.bodyMedium?.copyWith(color: colors.onSurfaceVariant),
        errorStyle: textTheme.labelSmall?.copyWith(color: colors.error),
      ),

      //* ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          minimumSize: const Size(0, AppSpacing.buttonHeightMd),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl2,
            vertical: AppSpacing.md,
          ),
          shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.button),
          elevation: 0,
          textStyle: textTheme.labelLarge,
        ),
      ),

      //* OutlinedButton
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.primary,
          minimumSize: const Size(0, AppSpacing.buttonHeightMd),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl2,
            vertical: AppSpacing.md,
          ),
          shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.button),
          side: BorderSide(color: colors.primary, width: AppSpacing.borderWidthStandard),
          textStyle: textTheme.labelLarge,
        ),
      ),

      //* TextButton
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.primary,
          minimumSize: const Size(0, AppSpacing.buttonHeightMd),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.button),
          textStyle: textTheme.labelLarge,
        ),
      ),

      //* Divider
      dividerTheme: DividerThemeData(
        color: colors.divider,
        thickness: AppSpacing.dividerThickness,
        space: 0,
      ),

      //* BottomNavigationBar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.surface,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.onSurfaceVariant,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: textTheme.labelSmall,
        unselectedLabelStyle: textTheme.labelSmall,
      ),

      //* NavigationBar (M3)
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.surface,
        indicatorColor: colors.primaryLight,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: colors.primary, size: AppSpacing.iconLg);
          }
          return IconThemeData(color: colors.onSurfaceVariant, size: AppSpacing.iconLg);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return textTheme.labelSmall?.copyWith(
              color: colors.primary,
              fontWeight: FontWeight.w600,
            );
          }
          return textTheme.labelSmall?.copyWith(color: colors.onSurfaceVariant);
        }),
      ),

      //* SnackBar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.onBackground,
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: colors.background),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.brMd),
      ),

      //* Dialog
      dialogTheme: DialogThemeData(
        backgroundColor: colors.surface,
        shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.dialog),
        titleTextStyle: textTheme.titleLarge?.copyWith(color: colors.onSurface),
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: colors.onSurfaceVariant),
        elevation: 0,
      ),

      //* Chip
      chipTheme: ChipThemeData(
        backgroundColor: colors.surfaceVariant,
        selectedColor: colors.primaryLight,
        labelStyle: textTheme.labelMedium?.copyWith(color: colors.onSurface),
        side: BorderSide(color: colors.border),
        shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.chip),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
      ),
    );
  }
}
