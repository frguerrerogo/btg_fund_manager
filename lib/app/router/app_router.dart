import 'package:btg_funds/app/router/router.dart' show $appRoutes, RouteConstants;
import 'package:btg_funds/core/core.dart' show AppRouteErrorWidget;
import 'package:go_router/go_router.dart';

/// Global GoRouter instance for the application navigation.
/// Routes are generated from `@TypedGoRoute` annotations in `app_routes.dart`.
/// Uses a custom error handler via `errorBuilder` with [AppRouteErrorWidget].
final appRouter = GoRouter(
  initialLocation: RouteConstants.funds,
  debugLogDiagnostics: true,
  routes: $appRoutes,
  errorBuilder: (context, state) => AppRouteErrorWidget(state: state),
);
