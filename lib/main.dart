import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:btg_fund_manager/core/core.dart' show AppTheme, appRouter, Injector;

void main() {
  // Usar rutas limpias sin '#' para Flutter Web.
  setUrlStrategy(PathUrlStrategy());

  // Iniciar inyección de dependencias.
  Injector.setup();

  // Habilitar Riverpod en toda la aplicación.
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();

    return MaterialApp.router(
      title: 'BTG Fund Manager',
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
      routerConfig: appRouter,
    );
  }
}
