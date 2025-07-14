import 'package:btg_fund_manager/domain/core/entities.dart' show Fund, FundTransaction;

abstract class FundsRepository {
  Future<List<Fund>> getFunds();
  Future<Fund> getFundById({required int id});
  Future<void> postSubscriptionToFund(FundTransaction data);
}
