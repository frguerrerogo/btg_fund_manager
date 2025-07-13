import 'package:btg_fund_manager/core/core.dart' show AppTheme;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:btg_fund_manager/presentation/core/views.dart' show HomeView;

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();
    return MaterialApp(
      title: 'BTG Fund Manager',
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
      home: const HomeView(),
    );
  }
}
