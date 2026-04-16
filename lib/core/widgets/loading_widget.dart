import 'package:btg_funds/core/core.dart';
import 'package:flutter/material.dart';

/// A centered circular loading indicator with theme integration.
///
/// Provides a lightweight placeholder while content is loading.
/// Supports customizable size and uses the app's color scheme.
class LoadingWidget extends StatelessWidget {
  /// Creates a [LoadingWidget].
  ///
  /// The [size] parameter is optional and defaults to 48.
  /// The [strokeWidth] parameter is optional and defaults to 4.
  const LoadingWidget({
    super.key,
    this.size = 48.0,
    this.strokeWidth = 7.0,
  });

  /// The diameter of the loading indicator.
  final double size;

  /// The width of the progress indicator's stroke.
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          valueColor: AlwaysStoppedAnimation<Color>(
            context.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
