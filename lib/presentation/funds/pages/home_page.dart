import 'package:btg_fund_manager/presentation/core/providers.dart'
    show fundListProvider, userProfileProvider;
import 'package:btg_fund_manager/presentation/core/widgets.dart' show AppScaffold;
import 'package:btg_fund_manager/presentation/funds/widgets/card_info_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:btg_fund_manager/core/core.dart' show AppTextStyles;

import 'package:btg_fund_manager/presentation/funds/widgets/fund_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final fundsAsync = ref.watch(fundListProvider);
    final profileAsync = ref.watch(userProfileProvider);

    return AppScaffold(
      title: 'Fondos BTG',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: profileAsync.when(
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text('Error: $e'),
          data: (profile) => fundsAsync.when(
            data: (funds) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Align(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: colorScheme.primary, width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Saldo',
                          style: AppTextStyles.bodyMedium(
                            context,
                          ).copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(profile.balance.toString(), style: AppTextStyles.titleMedium(context)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text('Fondos disponibles', style: AppTextStyles.titleMedium(context)),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: funds.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return FundCard(fund: funds[index]);
                    },
                  ),
                ),
              ],
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error loading funds: $e')),
          ),
        ),
      ),
    );
  }
}
