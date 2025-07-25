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
    return const NoTransitionPage(child: HomePage());
  }
}

/// FUND DETAIL
@TypedGoRoute<FundDetailRoute>(path: '/fund-detail/:id')
class FundDetailRoute extends GoRouteData with _$FundDetailRoute {

  const FundDetailRoute({required this.id});
  final int id;

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
      const NoTransitionPage(child: TransactionsPage());
}

/// SETTINGS
@TypedGoRoute<SettingsRoute>(path: '/settings')
class SettingsRoute extends GoRouteData with _$SettingsRoute {
  const SettingsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: SettingsPage());
}
