import 'package:btg_funds/core/core.dart' show dioClientProvider;
import 'package:btg_funds/features/transaction/data/data.dart'
    show
        TransactionMapper,
        TransactionRemoteDatasource,
        TransactionRemoteDatasourceImpl,
        TransactionRepositoryImpl;
import 'package:btg_funds/features/transaction/domain/domain.dart'
    show GetHistoryUseCase, SaveTransactionUseCase, TransactionRepository;
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for [TransactionRemoteDatasource], backed by [TransactionRemoteDatasourceImpl].
final transactionRemoteDatasourceProvider = Provider<TransactionRemoteDatasource>((ref) {
  return TransactionRemoteDatasourceImpl(ref.read(dioClientProvider));
});

/// Provider for [TransactionMapper].
final transactionMapperProvider = Provider<TransactionMapper>((ref) {
  return TransactionMapper();
});

/// Provider for [TransactionRepository], backed by [TransactionRepositoryImpl].
final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepositoryImpl(
    datasource: ref.read(transactionRemoteDatasourceProvider),
    mapper: ref.read(transactionMapperProvider),
  );
});

/// Provider for [GetHistoryUseCase].
final getHistoryUseCaseProvider = Provider<GetHistoryUseCase>((ref) {
  return GetHistoryUseCase(ref.read(transactionRepositoryProvider));
});

/// Provider for [SaveTransactionUseCase].
final saveTransactionUseCaseProvider = Provider<SaveTransactionUseCase>((ref) {
  return SaveTransactionUseCase(ref.read(transactionRepositoryProvider));
});
