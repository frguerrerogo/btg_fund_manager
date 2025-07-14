import 'package:btg_fund_manager/domain/core/entities.dart' show TransactionType;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:btg_fund_manager/core/core.dart' show AppTextStyles;
import 'package:btg_fund_manager/presentation/core/providers.dart'
    show fundTransactionProvider, fundListProvider;
import 'package:btg_fund_manager/presentation/core/widgets.dart' show AppScaffold;

class TransactionsPage extends ConsumerWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(fundTransactionProvider);
    final fundsAsync = ref.watch(fundListProvider);

    return AppScaffold(
      title: 'Historial',
      body: transactionsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error al cargar transacciones: $e')),
        data: (transactions) {
          return fundsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error al cargar fondos: $e')),
            data: (funds) {
              final fundMap = {for (var f in funds) f.id: f.name};

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Transacciones recientes', style: AppTextStyles.titleMedium(context)),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.separated(
                        itemCount: transactions.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final tx = transactions[index];
                          final isSub = tx.type == TransactionType.subscription;
                          final fundName = fundMap[tx.fundId] ?? 'Fondo desconocido';

                          return ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surfaceContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                isSub ? Icons.north_east : Icons.south_west,
                                color: Colors.black87,
                              ),
                            ),
                            title: Text(
                              fundName,
                              style: AppTextStyles.bodyMedium(
                                context,
                              ).copyWith(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              isSub ? 'Suscripción' : 'Cancelación',
                              style: AppTextStyles.bodySmall(context),
                            ),
                            trailing: Text(
                              '${isSub ? '+' : '-'}\$${tx.amount.abs().toStringAsFixed(0)}',
                              style: AppTextStyles.bodySmall(context).copyWith(
                                fontWeight: FontWeight.bold,
                                color: isSub ? Colors.green : Colors.red,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
