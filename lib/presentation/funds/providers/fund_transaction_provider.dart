import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:btg_fund_manager/data/core/providers/providers.dart' show fundsRepositoryProvider;
import 'package:btg_fund_manager/domain/core/entities.dart' show TransactionType, FundTransaction;

final registerFundTransactionProvider =
    Provider<
      Future<void> Function({
        required int fundId,
        required int amount,
        required TransactionType type,
      })
    >((ref) {
      final repository = ref.watch(fundsRepositoryProvider);

      return ({required int fundId, required int amount, required TransactionType type}) async {
        final transaction = FundTransaction(
          fundId: fundId,
          amount: amount,
          date: DateTime.now(),
          type: type,
        );
        await repository.postSubscriptionToFund(transaction);
      };
    });
