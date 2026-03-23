import 'package:btg_funds/core/core.dart' show AppBorderRadius, AppSpacing, AppThemeExtension;
import 'package:flutter/material.dart';

/// Layout type for error display
enum ErrorWidgetLayout {
  /// Horizontal banner layout with icon, message, and retry button
  banner,

  /// Centered vertical layout with large icon, message, and optional retry button
  centered,
}

/// Unified error widget that displays error messages with optional retry action.
///
/// This widget replaces AppErrorBanner and AppStateErrorWidget, providing
/// a flexible, consistent approach to displaying errors throughout the app.
class AppErrorWidget extends StatelessWidget {
  /// Creates an [AppErrorWidget] with the given [message] and optional [onRetry].
  const AppErrorWidget({
    required this.message,
    this.onRetry,
    this.layout = ErrorWidgetLayout.banner,
    this.maxWidth = 500,
    super.key,
  });

  /// The error message displayed in the widget.
  final String message;

  /// Optional callback triggered when the retry button is pressed.
  final VoidCallback? onRetry;

  /// The layout style for displaying the error.
  final ErrorWidgetLayout layout;

  /// Maximum width constraint for the widget.
  /// Only applies to banner layout.
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return switch (layout) {
      ErrorWidgetLayout.banner => _buildBannerLayout(context),
      ErrorWidgetLayout.centered => _buildCenteredLayout(context),
    };
  }

  Widget _buildBannerLayout(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        margin: const EdgeInsets.all(AppSpacing.lg),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
        decoration: BoxDecoration(
          color: context.colors.errorContainer,
          borderRadius: AppBorderRadius.brMd,
          border: Border.all(
            color: context.colors.error,
            width: AppSpacing.borderWidthThin,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: context.colors.error,
              size: AppSpacing.iconMd,
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                message,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colors.error,
                ),
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(width: AppSpacing.xs),
              TextButton(
                onPressed: onRetry,
                style: TextButton.styleFrom(
                  backgroundColor: context.colors.error,
                  foregroundColor: context.colors.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.xs,
                  ),
                  visualDensity: VisualDensity.compact,
                ),
                child: Text(
                  'Reintentar',
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.colors.onPrimary,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCenteredLayout(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: AppSpacing.iconXl3,
              color: context.colors.error,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge!.copyWith(
                color: context.colors.onSurface,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.lg),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Reintentar'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
