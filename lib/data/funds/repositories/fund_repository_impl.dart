import 'package:btg_fund_manager/data/core/adapters/adapters.dart' show FundAdapter;
import 'package:btg_fund_manager/data/core/datasources/remote/remote.dart'
    show FundRemoteDataSource;
import 'package:btg_fund_manager/domain/core/entities.dart' show Fund;
import 'package:btg_fund_manager/domain/core/repositories.dart' show FundRepository;

class FundRepositoryImpl implements FundRepository {
  final FundRemoteDataSource remoteDataSource;
  final FundAdapter adapter;

  FundRepositoryImpl({required this.remoteDataSource, required this.adapter});

  @override
  Future<List<Fund>> getFunds() async {
    final models = await remoteDataSource.getFunds();
    return models.map((m) => adapter.modelToEntity(m)).toList();
  }

  @override
  Future<Fund> getFundById({required int id}) async {
    final model = await remoteDataSource.getFundById(id: id);
    return adapter.modelToEntity(model);
  }
}
