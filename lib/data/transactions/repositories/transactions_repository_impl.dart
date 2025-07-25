import 'package:btg_fund_manager/data/core/adapters/adapters.dart' show FundTransactionAdapter;
import 'package:btg_fund_manager/data/core/datasources/remote/remote.dart'
    show TransactionsRemoteDataSource;
import 'package:btg_fund_manager/domain/core/entities.dart' show FundTransaction;
import 'package:btg_fund_manager/domain/core/repositories.dart' show TransactionsRepository;

class TransactionsRepositoryImpl implements TransactionsRepository {

  TransactionsRepositoryImpl({
    required this.transactionsRemoteDataSource,
    required this.fundTransactionAdapter,
  });
  final TransactionsRemoteDataSource transactionsRemoteDataSource;
  final FundTransactionAdapter fundTransactionAdapter;

  @override
  Future<List<FundTransaction>> getTransactions() async {
    final models = await transactionsRemoteDataSource.getTransactions();
    return models.map((m) => fundTransactionAdapter.modelToEntity(m)).toList();
  }
}
