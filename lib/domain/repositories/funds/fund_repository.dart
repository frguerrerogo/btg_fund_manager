import 'package:btg_fund_manager/domain/entities/entities.dart' show Fund;

abstract class FundRepository {
  Future<List<Fund>> getFunds();
}
