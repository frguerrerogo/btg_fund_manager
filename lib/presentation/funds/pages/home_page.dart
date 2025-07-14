import 'package:btg_fund_manager/presentation/core/providers.dart' show fundListProvider;
import 'package:btg_fund_manager/presentation/core/widgets.dart' show AppScaffold;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:btg_fund_manager/core/core.dart' show AppTextStyles;

import 'package:btg_fund_manager/presentation/funds/widgets/fund_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fundsAsync = ref.watch(fundListProvider);

    return AppScaffold(
      title: 'Fondos BTG',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: fundsAsync.when(
          data: (funds) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
    );
  }
}
