import 'package:btg_funds/core/core.dart'
    show AppBorderRadius, AppSpacing, AppThemeExtension, CurrencyFormatter, LocalizationExtension;
import 'package:btg_funds/features/funds/domain/domain.dart' show FundCategory, FundEntity;
import 'package:flutter/material.dart';

/// A card that displays a fund summary with a primary action.
///
/// Provides an at-a-glance view for browsing funds and triggering subscription actions.
class FundCard extends StatelessWidget {
  /// Creates a [FundCard] with the given [fund], [onSubscribe], and [onCancel].
  const FundCard({
    required this.fund,
    required this.onSubscribe,
    required this.onCancel,
    super.key,
  });

  /// Card height constraint
  static const double height = 160;

  /// Fund information presented in the card.
  final FundEntity fund;

  /// Action invoked when the user chooses to subscribe.
  final VoidCallback onSubscribe;

  /// Action invoked when the user chooses to cancel a subscription.
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          fund.name,
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      _CategoryBadge(category: fund.category),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    '${context.l10n.minimumAmountLabel}: ${fund.minimumAmount.formatCOP()}',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              Align(
                child: SizedBox(
                  width: 140,
                  child: fund.isSubscribed
                      ? OutlinedButton.icon(
                          onPressed: onCancel,
                          icon: const Icon(Icons.cancel_outlined, size: AppSpacing.iconLg),
                          label: Text(
                            context.l10n.cancelButtonLabel,
                            style: context.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.lg,
                              vertical: AppSpacing.sm,
                            ),
                            side: BorderSide(
                              color: context.colors.error,
                              width: AppSpacing.borderWidthStandard,
                            ),
                            foregroundColor: context.colors.error,
                          ),
                        )
                      : ElevatedButton.icon(
                          onPressed: onSubscribe,
                          icon: const Icon(Icons.add, size: AppSpacing.iconLg),
                          label: Text(
                            context.l10n.subscribeButtonLabel,
                            style: context.textTheme.labelLarge?.copyWith(
                              color: context.colors.onPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.lg,
                              vertical: AppSpacing.sm,
                            ),
                            backgroundColor: context.colors.primary,
                            foregroundColor: context.colors.onPrimary,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryBadge extends StatelessWidget {
  const _CategoryBadge({required this.category});

  final FundCategory category;

  @override
  Widget build(BuildContext context) {
    final isFpv = category == FundCategory.fpv;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: isFpv ? context.colors.successContainer : context.colors.infoContainer,
        borderRadius: AppBorderRadius.chip,
      ),
      child: Text(
        isFpv ? context.l10n.fundCategoryFpv : context.l10n.fundCategoryFic,
        style: context.textTheme.labelMedium?.copyWith(
          color: isFpv ? context.colors.success : context.colors.info,
        ),
      ),
    );
  }
}
