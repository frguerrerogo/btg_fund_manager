import 'dart:convert';
import 'package:btg_fund_manager/data/core/datasources/remote/core/remote_utils.dart';
import 'package:btg_fund_manager/data/core/models/models.dart' show FundModel;
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

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
    final jsonResponse = await _getJsonFromGetRequest(uri);

    final List<dynamic> list = RemoteUtils.validateListResponse(jsonResponse);
    return list.map((json) => FundModel.fromJson(json)).toList();
  }

  @override
  Future<FundModel> getFundById({required int id}) async {
    final uri = Uri.parse('$_baseUrl/funds?id=$id');
    final jsonResponse = await _getJsonFromGetRequest(uri);

    if (jsonResponse is List && jsonResponse.isNotEmpty) {
      return FundModel.fromJson(RemoteUtils.validateMapResponse(jsonResponse[0]));
    } else {
      throw Exception("No se encontró el fondo con id=$id");
    }
  }
}

Future<dynamic> _getJsonFromGetRequest(Uri uri) async {
  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(RemoteUtils.handleError(response.statusCode));
    }
  } on ClientException catch (e) {
    throw Exception("Fallo de conexión con el servidor: ${e.message}");
  } on FormatException catch (e) {
    throw Exception("Error de formato en la respuesta: ${e.message}");
  } catch (e) {
    throw Exception("Error inesperado: ${e.toString()}");
  }
}
