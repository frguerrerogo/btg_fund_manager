import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:btg_fund_manager/data/core/models.dart' show FundModel;

abstract class FundRemoteDataSource {
  Future<List<FundModel>> getFunds();
}

class FundRemoteDataSourceImpl implements FundRemoteDataSource {
  final http.Client client;

  FundRemoteDataSourceImpl(this.client);

  @override
  Future<List<FundModel>> getFunds() async {
    final response = await client.get(Uri.parse('http://localhost:3000/funds'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => FundModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener los fondos');
    }
  }
}
