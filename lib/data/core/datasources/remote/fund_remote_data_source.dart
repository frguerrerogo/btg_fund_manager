import 'dart:convert';
import 'package:btg_fund_manager/data/core/datasources/remote/remote_utils.dart';
import 'package:btg_fund_manager/data/core/models/models.dart' show FundModel;
import 'package:http/http.dart' as http;

const String _baseUrl = 'http://localhost:3000';

abstract class FundRemoteDataSource {
  Future<List<FundModel>> getFunds();
}

class FundRemoteDataSourceImpl implements FundRemoteDataSource {
  final http.Client client;

  FundRemoteDataSourceImpl(this.client);

  @override
  Future<List<FundModel>> getFunds() async {
    final uri = Uri.parse(_baseUrl);

    try {
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> list = RemoteUtils.validateListResponse(jsonResponse);
        return list.map((json) => FundModel.fromJson(json)).toList();
      } else {
        throw Exception(RemoteUtils.handleError(response.statusCode));
      }
    } on http.ClientException catch (e) {
      throw Exception("Fallo de conexión con el servidor: ${e.message}");
    } on FormatException catch (e) {
      throw Exception("Error de formato en la respuesta: ${e.message}");
    } catch (e) {
      throw Exception("Error inesperado: ${e.toString()}");
    }
  }
}
