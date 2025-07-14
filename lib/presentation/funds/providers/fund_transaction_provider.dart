import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btg_fund_manager/data/core/providers/providers.dart' show fundsRepositoryProvider;
import 'package:btg_fund_manager/domain/core/entities.dart' show TransactionType, FundTransaction;

/// Proveedor que expone una función para registrar una transacción en un fondo.
/// Permite registrar tanto suscripciones como cancelaciones.
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
        // Se construye el objeto de transacción con la fecha actual
        final transaction = FundTransaction(
          fundId: fundId,
          amount: amount,
          date: DateTime.now(),
          type: type,
        );

        // Se envía la transacción al repositorio
        await repository.postSubscriptionToFund(transaction);
      };
    });
