import 'package:btg_fund_manager/data/core/adapters/adapters.dart'
    show FundAdapter, FundTransactionAdapter;
import 'package:btg_fund_manager/data/core/datasources/remote/remote.dart'
    show FundsRemoteDataSource, TransactionsRemoteDataSource;
import 'package:btg_fund_manager/domain/core/entities.dart' show Fund, FundTransaction;
import 'package:btg_fund_manager/domain/core/repositories.dart' show FundRepository;

class FundRepositoryImpl implements FundRepository {
  final FundsRemoteDataSource fundsRemoteDataSource;
  final TransactionsRemoteDataSource transactionsRemoteDataSource;
  final FundAdapter fundAdapter;
  final FundTransactionAdapter fundTransactionAdapter;

  FundRepositoryImpl({
    required this.fundsRemoteDataSource,
    required this.transactionsRemoteDataSource,
    required this.fundAdapter,
    required this.fundTransactionAdapter,
  });

  @override
  Future<List<Fund>> getFunds() async {
    final models = await fundsRemoteDataSource.getFunds();
    return models.map((m) => fundAdapter.modelToEntity(m)).toList();
  }

  @override
  Future<Fund> getFundById({required int id}) async {
    final model = await fundsRemoteDataSource.getFundById(id: id);
    return fundAdapter.modelToEntity(model);
  }

  @override
  Future<void> postSubscriptionToFund(FundTransaction data) async {
    await transactionsRemoteDataSource.postSubscriptionToFund(
      fundTransactionAdapter.entityToModel(data),
    );
  }
}
