import 'package:flutter/material.dart';

import 'package:btg_fund_manager/core/core.dart' show AppTextStyles, FundDetailRoute;
import 'package:btg_fund_manager/domain/core/entities.dart' show Fund;

class FundCard extends StatelessWidget {
  final Fund fund;

  const FundCard({super.key, required this.fund});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorScheme.onPrimary,
          ),
          child: Icon(Icons.account_balance_wallet_outlined, color: colorScheme.primary),
        ),
        title: Text(fund.name, style: AppTextStyles.bodyMedium(context)),
        subtitle: Text(fund.category, style: AppTextStyles.bodySmall(context)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => FundDetailRoute(id: fund.id).go(context),
      ),
    );
  }
}
