import 'package:flutter/material.dart';
import '../../../domain/entities/funds/fund.dart';

class FundCard extends StatelessWidget {
  final Fund fund;

  const FundCard({super.key, required this.fund});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.brown[100],
          ),
          child: const Icon(Icons.account_balance_wallet_outlined),
        ),
        title: Text(fund.name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(fund.category),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Navegar al detalle del fondo
        },
      ),
    );
  }
}
