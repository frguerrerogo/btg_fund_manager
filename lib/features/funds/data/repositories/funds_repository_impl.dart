import 'package:btg_funds/features/funds/data/data.dart' show FundMapper, FundsRemoteDatasource;
import 'package:btg_funds/features/funds/domain/domain.dart' show FundEntity, FundsRepository;

/// Remote-based implementation of [FundsRepository].
class FundsRepositoryImpl implements FundsRepository {
  /// Creates a [FundsRepositoryImpl] with the given [fundsDatasource] and [fundMapper].
  const FundsRepositoryImpl({
    required FundsRemoteDatasource fundsDatasource,
    required FundMapper fundMapper,
  }) : _fundsDatasource = fundsDatasource,
       _fundMapper = fundMapper;

  final FundsRemoteDatasource _fundsDatasource;
  final FundMapper _fundMapper;

  @override
  Future<List<FundEntity>> getFunds() async {
    final dtos = await _fundsDatasource.getFunds();
    return _fundMapper.modelsToEntities(dtos);
  }

  @override
  Future<FundEntity> getFundById(String id) async {
    final dto = await _fundsDatasource.getFundById(id);
    return _fundMapper.modelToEntity(dto);
  }
}
