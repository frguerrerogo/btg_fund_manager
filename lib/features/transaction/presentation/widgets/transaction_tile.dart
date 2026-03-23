import 'package:btg_funds/core/core.dart' show LocalizationExtension;
import 'package:btg_funds/core/extensions/currency_formatter.dart';
import 'package:btg_funds/core/extensions/date_time_formatter.dart';
import 'package:btg_funds/core/theme/theme.dart';
import 'package:btg_funds/features/transaction/domain/entities/transaction_entity.dart';
import 'package:flutter/material.dart';

/// A card-style row that summarizes a single transaction.
///
/// Provides a compact visual representation for transaction history lists.
class TransactionTile extends StatelessWidget {
  /// Creates a [TransactionTile] with the given [transaction].
  const TransactionTile({
    required this.transaction,
    super.key,
  });

  /// Transaction data displayed by this tile.
  final TransactionEntity transaction;

  @override
  Widget build(BuildContext context) {
    final isSubscription = transaction.isSubscription;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            Container(
              width: AppSpacing.iconXl,
              height: AppSpacing.iconXl,
              decoration: BoxDecoration(
                color: isSubscription ? context.colors.error : context.colors.success,
                borderRadius: AppBorderRadius.brSm,
              ),
              child: Icon(
                isSubscription ? Icons.arrow_downward : Icons.arrow_upward,
                color: isSubscription ? context.colors.errorContainer : context.colors.success,
                size: AppSpacing.iconLg,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isSubscription
                        ? context.l10n.subscriptionTransactionLabel
                        : context.l10n.cancellationTransactionLabel,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isSubscription ? context.colors.error : context.colors.success,
                    ),
                  ),
                  Text(
                    transaction.fundName,
                    style: context.textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${context.l10n.notificationMethodLabel}: ${transaction.notificationMethod == NotificationMethod.email ? context.l10n.notificationMethodEmail : context.l10n.notificationMethodSms}',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${isSubscription ? '-' : '+'}${transaction.amount.formatCOP()}',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isSubscription ? context.colors.error : context.colors.success,
                  ),
                ),
                Text(
                  transaction.createdAt.formatTransactionDateTime(),
                  style: context.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
