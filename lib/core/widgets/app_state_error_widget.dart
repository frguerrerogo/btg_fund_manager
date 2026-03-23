import 'package:btg_funds/core/core.dart' show AppSpacing, AppThemeExtension;
import 'package:flutter/material.dart';

/// A centered error message with an optional retry action.
///
/// Provides a simple UI to communicate recoverable failures.
class AppStateErrorWidget extends StatelessWidget {
  /// Creates a [AppStateErrorWidget] with the given [message].
  /// Creates a [AppStateErrorWidget] with the given [onRetry].
  const AppStateErrorWidget({
    required this.message,
    super.key,
    this.onRetry,
  });

  /// Text shown to describe the error state.
  final String message;

  /// Optional [VoidCallback] invoked when the user taps retry.
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: AppSpacing.iconXl3, color: context.colors.error),
            const SizedBox(height: AppSpacing.md),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
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
