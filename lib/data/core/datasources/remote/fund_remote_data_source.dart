import 'package:btg_fund_manager/data/core/datasources/remote/core/http_helper.dart';
import 'package:btg_fund_manager/data/core/datasources/remote/core/remote_utils.dart';
import 'package:btg_fund_manager/data/core/models/models.dart' show FundModel;

const String _baseUrl = 'http://localhost:3000';

abstract class FundRemoteDataSource {
  Future<List<FundModel>> getFunds();
  Future<FundModel> getFundById({required int id});
}

class FundRemoteDataSourceImpl implements FundRemoteDataSource {
  FundRemoteDataSourceImpl();

  @override
  Future<List<FundModel>> getFunds() async {
    final uri = Uri.parse('$_baseUrl/funds');
    final jsonResponse = await HttpHelper.getJsonFromGetRequest(uri);

    final List<dynamic> list = RemoteUtils.validateListResponse(jsonResponse);
    return list.map((json) => FundModel.fromJson(json)).toList();
  }

  @override
  Future<FundModel> getFundById({required int id}) async {
    final uri = Uri.parse('$_baseUrl/funds?id=$id');
    final jsonResponse = await HttpHelper.getJsonFromGetRequest(uri);

    if (jsonResponse is List && jsonResponse.isNotEmpty) {
      return FundModel.fromJson(RemoteUtils.validateMapResponse(jsonResponse[0]));
    } else {
      throw Exception("No se encontró el fondo con id=$id");
    }
  }
}
