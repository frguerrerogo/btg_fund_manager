import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:btg_fund_manager/presentation/core/pages.dart';

NoTransitionPage<T> noTransitionPage<T>(Widget child) {
  return NoTransitionPage<T>(child: child);
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      name: 'home',
      pageBuilder: (context, state) => noTransitionPage(HomePage()),
    ),
    GoRoute(
      path: '/history',
      name: 'history',
      pageBuilder: (context, state) => noTransitionPage(HistoryPage()),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      pageBuilder: (context, state) => noTransitionPage(SettingsPage()),
    ),
  ],
);
