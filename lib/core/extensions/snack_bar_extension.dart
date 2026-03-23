import 'package:btg_funds/core/theme/theme.dart';
import 'package:flutter/material.dart';

/// Extension on BuildContext to display snack bars globally.
extension SnackBarExtension on BuildContext {
  /// Shows a snack bar with the given [message] and [backgroundColor].
  void showSnackBar(
    String message, {
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 4),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(this).textTheme.bodyMedium!.copyWith(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: backgroundColor ?? Theme.of(this).colorScheme.outline,
        duration: duration,
        behavior: behavior,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.brSm,
        ),
      ),
    );
  }

  /// Shows a success snack bar.
  void showSuccessSnackBar(String message) {
    showSnackBar(message, backgroundColor: colors.success);
  }

  /// Shows an error snack bar.
  void showErrorSnackBar(String message) {
    showSnackBar(message, backgroundColor: colors.error);
  }

  /// Shows a warning snack bar.
  void showWarningSnackBar(String message) {
    showSnackBar(message, backgroundColor: colors.warning);
  }

  /// Shows an info snack bar.
  void showInfoSnackBar(String message) {
    showSnackBar(message, backgroundColor: colors.info);
  }
}
