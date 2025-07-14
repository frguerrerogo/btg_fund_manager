import 'package:btg_fund_manager/data/core/datasources/remote/core/http_helper.dart';
import 'package:btg_fund_manager/data/core/models/models.dart' show FundTransactionModel;

const String _baseUrl = 'http://localhost:3000';

abstract class TransactionsRemoteDataSource {
  Future<void> postSubscriptionToFund(FundTransactionModel data);
}

class TransactionsRemoteDataSourceImpl implements TransactionsRemoteDataSource {
  TransactionsRemoteDataSourceImpl();

  @override
  Future<void> postSubscriptionToFund(FundTransactionModel data) async {
    final uri = Uri.parse('$_baseUrl/transactions');
    await HttpHelper.postJsonRequest(uri, data.toJson());
  }
}
