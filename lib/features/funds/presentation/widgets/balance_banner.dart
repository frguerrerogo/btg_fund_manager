import 'package:btg_funds/core/extensions/currency_formatter.dart';
import 'package:btg_funds/core/theme/theme.dart';
import 'package:flutter/material.dart';

/// A header banner that shows the user's available balance.
///
/// Provides a quick summary of balance and subscribed funds on the funds screen.
class BalanceBanner extends StatelessWidget {
  /// Creates a [BalanceBanner] with the given [balance] and [subscribedCount].
  const BalanceBanner({
    required this.balance,
    required this.subscribedCount,
    super.key,
  });

  /// Current available balance displayed in the banner.
  final double balance;

  /// Number of subscribed funds displayed as a summary.
  final int subscribedCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: AppBorderRadius.brMd,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saldo disponible',
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colors.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs2),
                Text(
                  balance.formatCOP(),
                  style: context.textTheme.displaySmall?.copyWith(
                    color: context.colors.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Fondos suscritos',
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colors.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSpacing.xs2),
              Text(
                '$subscribedCount',
                style: context.textTheme.displaySmall?.copyWith(
                  color: context.colors.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
