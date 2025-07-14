import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:btg_fund_manager/presentation/core/pages.dart';

part 'app_routes.g.dart';

/// HOME
@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(child: const HomePage());
  }
}

/// FUND DETAIL
@TypedGoRoute<FundDetailRoute>(path: '/fund-detail/:id')
class FundDetailRoute extends GoRouteData with _$FundDetailRoute {
  final int id;

  const FundDetailRoute({required this.id});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(child: FundDetailPage(fundId: id));
}

/// TRANSACTIONS
@TypedGoRoute<TransactionsRoute>(path: '/transactions')
class TransactionsRoute extends GoRouteData with _$TransactionsRoute {
  const TransactionsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(child: TransactionsPage());
}

/// SETTINGS
@TypedGoRoute<SettingsRoute>(path: '/settings')
class SettingsRoute extends GoRouteData with _$SettingsRoute {
  const SettingsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(child: SettingsPage());
}
