import 'package:btg_fund_manager/data/core/providers/providers.dart'
    show transactionsRepositoryProvider;
import 'package:btg_fund_manager/domain/core/entities.dart' show FundTransaction;
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Proveedor que obtiene y expone la lista de transacciones del usuario.
/// Se destruye automáticamente cuando no se usa para liberar recursos.
final fundTransactionProvider = FutureProvider.autoDispose<List<FundTransaction>>((ref) async {
  final repository = ref.watch(transactionsRepositoryProvider);

  // Se obtiene la lista de transacciones desde el repositorio
  final data = await repository.getTransactions();

  // Ordena las transacciones por fecha descendente (más recientes primero)
  data.sort((a, b) => b.date.compareTo(a.date));

  return data;
});
