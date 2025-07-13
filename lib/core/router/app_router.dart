import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:btg_fund_manager/presentation/core/views.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', name: 'home', builder: (context, state) => const HomePage()),
    // GoRoute(path: '/history', name: 'history', builder: (context, state) => const HistoryPage()),
    // GoRoute(path: '/settings', name: 'settings', builder: (context, state) => const SettingsPage()),
  ],
);
