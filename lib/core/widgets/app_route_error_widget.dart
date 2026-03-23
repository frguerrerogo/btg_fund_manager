import 'package:btg_funds/core/core.dart'
    show AppErrorWidget, ErrorMappingExtension, ErrorWidgetLayout;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Error UI used by GoRouter's route-level error handling.
///
/// Displays a user-friendly message mapped from [GoRouterState.error] and
/// provides an optional retry action.
class AppRouteErrorWidget extends StatelessWidget {
  /// Creates an [AppRouteErrorWidget] for the given router [state].
  const AppRouteErrorWidget({required this.state, super.key});

  /// The [GoRouterState] provided by the router error handler.
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    final error = state.error;

    return AppErrorWidget(
      message: (error ?? Exception()).mapTechnicalErrorToMessage(),
      onRetry: () => GoRouter.of(context).refresh(),
      layout: ErrorWidgetLayout.centered,
    );
  }
}
