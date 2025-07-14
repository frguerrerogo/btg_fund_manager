import 'package:btg_fund_manager/data/core/providers/providers.dart'
    show transactionsRepositoryProvider;
import 'package:btg_fund_manager/domain/core/entities.dart' show FundTransaction;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fundTransactionProvider = FutureProvider.autoDispose<List<FundTransaction>>((ref) async {
  final repository = ref.watch(transactionsRepositoryProvider);
  return await repository.getTransactions();
});
