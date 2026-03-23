import 'package:btg_funds/app/router/router.dart' show appRouter;
import 'package:btg_funds/core/core.dart' show AppTheme;
import 'package:btg_funds/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// The root widget of the application.
///
/// Provides the MaterialApp entry point for the UI.
class App extends StatelessWidget {
  /// Creates an [App].
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BTG Funds',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      locale: const Locale('es'),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
