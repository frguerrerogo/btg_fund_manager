import 'package:btg_fund_manager/domain/core/entities.dart' show Fund;

abstract class FundRepository {
  Future<List<Fund>> getFunds();
  Future<Fund> getFundById({required int id});
}
