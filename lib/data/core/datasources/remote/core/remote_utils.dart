class RemoteUtils {
  // Método para validar si la respuesta es un mapa
  static Map<String, dynamic> validateMapResponse(dynamic jsonResponse) {
    if (jsonResponse is Map<String, dynamic>) {
      return jsonResponse;
    } else {
      throw const FormatException("Invalid JSON format: Expected a map");
    }
  }

  // Método para validar si la respuesta es una lista
  static List<dynamic> validateListResponse(dynamic jsonResponse) {
    if (jsonResponse is List) {
      return jsonResponse;
    } else {
      throw const FormatException("Invalid JSON format: Expected a list");
    }
  }

  // Método para manejar errores específicos según el código de estado
  static String handleError(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad request: The server could not understand the request.";
      case 401:
        return "Unauthorized: API key is missing or invalid.";
      case 404:
        return "Not found: The requested resource was not found.";
      case 500:
        return "Internal server error: The server encountered an unexpected condition.";
      default:
        return "Failed to load weather data. Status code: $statusCode";
    }
  }
}
