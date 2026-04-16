import 'package:btg_funds/core/core.dart' show LocalizationExtension;
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
    final isMobile = context.isMobile;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: AppBorderRadius.brMd,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBalanceSection(context),
                const SizedBox(height: AppSpacing.lg),
                _buildSubscribedSection(context),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildBalanceSection(context),
                ),
                _buildSubscribedSection(context),
              ],
            ),
    );
  }

  Widget _buildBalanceSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.balanceLabel,
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.xs2),
        Text(
          balance.formatCOP(),
          style: context.textTheme.displaySmall?.copyWith(
            color: context.colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildSubscribedSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.subscribedFundsLabel,
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.xs2),
        Text(
          '$subscribedCount',
          style: context.textTheme.displaySmall?.copyWith(
            color: context.colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
