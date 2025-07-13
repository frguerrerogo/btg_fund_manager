import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:btg_fund_manager/domain/entities/entities.dart'
    show FundTransaction, TransactionType;

final fundTransactionHistoryProvider = FutureProvider<List<FundTransaction>>((ref) async {
  // Simulación de delay
  await Future.delayed(const Duration(seconds: 1));

  return [
    FundTransaction(
      fundId: '1',
      amount: 5000,
      date: DateTime.now().subtract(const Duration(days: 1)),
      type: TransactionType.subscription,
    ),
    FundTransaction(
      fundId: '2',
      amount: -2500,
      date: DateTime.now().subtract(const Duration(days: 2)),
      type: TransactionType.cancellation,
    ),
    FundTransaction(
      fundId: '3',
      amount: 3000,
      date: DateTime.now().subtract(const Duration(days: 3)),
      type: TransactionType.subscription,
    ),
    FundTransaction(
      fundId: '4',
      amount: -1800,
      date: DateTime.now().subtract(const Duration(days: 4)),
      type: TransactionType.cancellation,
    ),
    FundTransaction(
      fundId: '5',
      amount: 4200,
      date: DateTime.now().subtract(const Duration(days: 5)),
      type: TransactionType.subscription,
    ),
    FundTransaction(
      fundId: '1',
      amount: -1200,
      date: DateTime.now().subtract(const Duration(days: 6)),
      type: TransactionType.cancellation,
    ),
  ];
});
