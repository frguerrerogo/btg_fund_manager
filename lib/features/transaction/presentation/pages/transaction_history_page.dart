import 'package:btg_funds/core/core.dart'
    show
        AppErrorWidget,
        AppSpacing,
        AppThemeExtension,
        ErrorMappingExtension,
        ErrorWidgetLayout,
        LoadingWidget,
        LocalizationExtension,
        ResponsiveExtension;
import 'package:btg_funds/features/transaction/presentation/presentation.dart'
    show TransactionState, TransactionTile, transactionControllerProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A transaction history screen with a list of past transactions.
///
/// Provides a simple view for reviewing the user's activity.
class TransactionHistoryPage extends ConsumerWidget {
  /// Creates a [TransactionHistoryPage].
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(transactionControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.transactionHistoryPageTitle,
          style: context.textTheme.headlineLarge?.copyWith(
            color: context.colors.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (error, _) => AppErrorWidget(
          message: error.mapTechnicalErrorToMessage(),
          onRetry: () => ref.invalidate(transactionControllerProvider),
          layout: ErrorWidgetLayout.centered,
        ),
        data: _buildContent,
      ),
    );
  }

  Widget _buildContent(TransactionState historyState) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontalPadding = constraints.responsiveHorizontalPadding;

        if (historyState.transactions.isEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: AppSpacing.iconXl2,
                    color: context.colors.placeholder,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    context.l10n.emptyTransactionsList,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.placeholder,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: AppSpacing.screenVertical,
          ),
          itemCount: historyState.transactions.length,
          itemBuilder: (context, index) => TransactionTile(
            transaction: historyState.transactions[index],
          ),
        );
      },
    );
  }
}
