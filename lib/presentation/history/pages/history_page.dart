import 'package:flutter/material.dart';

import 'package:btg_fund_manager/presentation/core/widgets.dart' show AppScaffold;

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Historial',
      body: Center(child: Text('Contenido del historial')),
    );
  }
}
