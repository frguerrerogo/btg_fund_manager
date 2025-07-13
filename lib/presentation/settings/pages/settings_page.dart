import 'package:flutter/material.dart';

import 'package:btg_fund_manager/presentation/core/widgets.dart' show AppScaffold;

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Configuración',
      body: Center(child: Text('Contenido de la configuración')),
    );
  }
}
