import 'package:btg_fund_manager/domain/core/entities.dart' show FundTransaction;

abstract class TransactionsRepository {
  Future<List<FundTransaction>> getTransactions();
}
