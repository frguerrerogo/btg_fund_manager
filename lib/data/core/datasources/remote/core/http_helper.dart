import 'dart:convert';
import 'package:btg_fund_manager/data/core/datasources/remote/core/remote_utils.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpHelper {
  static Future<dynamic> getJsonRequest(Uri uri) async {
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

  static Future<dynamic> postJsonRequest(Uri uri, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
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

  static Future<void> deleteRequest(Uri uri) async {
    try {
      final response = await http.delete(uri);

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception(RemoteUtils.handleError(response.statusCode));
      }
    } on ClientException catch (e) {
      throw Exception("Fallo de conexión con el servidor: ${e.message}");
    } catch (e) {
      throw Exception("Error inesperado: ${e.toString()}");
    }
  }

  static Future<dynamic> patchJsonRequest(Uri uri, Map<String, dynamic> body) async {
    try {
      final response = await http.patch(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
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
}
