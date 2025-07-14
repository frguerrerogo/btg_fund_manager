import 'package:btg_fund_manager/data/core/datasources/remote/core/http_helper.dart';
import 'package:btg_fund_manager/data/core/datasources/remote/core/remote_utils.dart';
import 'package:btg_fund_manager/data/core/models/models.dart' show FundTransactionModel;

const String _baseUrl = 'http://localhost:3000';

abstract class TransactionsRemoteDataSource {
  Future<List<FundTransactionModel>> getTransactions();
  Future<void> postSubscriptionToFund(FundTransactionModel data);
}

class TransactionsRemoteDataSourceImpl implements TransactionsRemoteDataSource {
  TransactionsRemoteDataSourceImpl();

  @override
  Future<List<FundTransactionModel>> getTransactions() async {
    final uri = Uri.parse('$_baseUrl/transactions');
    final jsonResponse = await HttpHelper.getJsonRequest(uri);

    final List<dynamic> list = RemoteUtils.validateListResponse(jsonResponse);
    return list.map((json) => FundTransactionModel.fromJson(json)).toList();
  }

  @override
  Future<void> postSubscriptionToFund(FundTransactionModel data) async {
    final uri = Uri.parse('$_baseUrl/transactions');
    await HttpHelper.postJsonRequest(uri, data.toJson());
  }
}
